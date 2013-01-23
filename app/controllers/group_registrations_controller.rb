class GroupRegistrationsController < InheritedResources::Base
  defaults :resource_class => Group, :collection_name => 'groups', :instance_name => 'group'
  actions :new, :create
  respond_to :json

  def create

  	result = {}

  	owner = User.new(user_params)
  	group = Group.new(group_params)

		owner.save

		if owner.errors.blank? 

			group.owner_id = owner.id
			group.users << owner

			group.save

			if group.errors.blank?
				result = group
			else
				add_error group.errors.messages
			end

		else
			add_error group.errors.messages unless group.valid?
			add_error owner.errors.messages
		end

		result[:errors] = errors if have_errors?

		respond_to do |format|
			format.json  { render json: result }
		end
  end

  private

  	def creation_data
			params[:group]
  	end

  	def user_params
  		creation_data[:owner]
  	end

  	def group_params
  		group = creation_data
  		group.delete :owner
  		group
  	end

  	def add_error(error)
  		errors.merge! error		
  	end

  	def errors
  		@errors = {} unless have_errors?
  		@errors
  	end

  	def have_errors?
  		not @errors.nil? 
  	end

end
