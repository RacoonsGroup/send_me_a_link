SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.NewView extends Backbone.View
  template: JST["backbone/templates/group_registrations/new"]

  render: ->
    @$el.html(@template())
    return this
