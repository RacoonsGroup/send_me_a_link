class GroupsController < InheritedResources::Base
  actions :show
  respond_to :html

  private

    def begin_of_association_chain
      current_user
    end
end
