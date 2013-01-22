class SendMeALink.Models.Group extends Backbone.Model
  paramRoot: 'group'

  # defaults:

class SendMeALink.Collections.GroupsCollection extends Backbone.Collection
  model: SendMeALink.Models.Group
  url: '/groups'
