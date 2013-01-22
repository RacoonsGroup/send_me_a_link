class GroupRegistrationsController < InheritedResources::Base
  defaults :resource_class => Group, :collection_name => 'groups', :instance_name => 'group'
  actions :new, :create
  respond_to :json
end
