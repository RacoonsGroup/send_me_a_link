class SendMeALink.Models.Group extends Backbone.Model
  paramRoot: 'group'
  urlRoot: '/group_registrations'

  # defaults:

class SendMeALink.Collections.GroupsCollection extends Backbone.Collection
  model: SendMeALink.Models.Group
  url: '/group_registrations'
