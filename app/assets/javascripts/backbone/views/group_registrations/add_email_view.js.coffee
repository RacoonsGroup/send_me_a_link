SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.AddEmailView extends Backbone.View
  template: JST["backbone/templates/group_registrations/add_email"]

  render: ->
    @$el.html(@template())
    return this
