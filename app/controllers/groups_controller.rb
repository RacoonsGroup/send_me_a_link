class GroupsController < InheritedResources::Base
  actions :show
  respond_to :html
  before_filter :authenticate_user!

  private

    def resource
      current_user.groups.find_by(slug: request.subdomain)
    end
end
