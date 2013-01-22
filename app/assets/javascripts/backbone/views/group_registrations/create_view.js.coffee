SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.CreateView extends Backbone.View
  template: JST["backbone/templates/group_registrations/create"]

  render: ->
    @$el.html(@template())
    return this
