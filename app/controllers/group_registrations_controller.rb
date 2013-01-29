class GroupRegistrationsController < InheritedResources::Base
  defaults :resource_class => Group, :collection_name => 'groups', :instance_name => 'group'
  actions :new, :create
  respond_to :html


  def create
    create! do |success, failure|
      failure.html { redirect_to :back }
      success.html do
        sign_in(:user, resource.owners.last)
        redirect_to resource
      end
    end
  end

end
