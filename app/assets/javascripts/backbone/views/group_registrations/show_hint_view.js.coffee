SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.ShowHintView extends Backbone.View
  template: JST["backbone/templates/group_registrations/show_hint"]

  render: ->
    @$el.html(@template())
    return this
