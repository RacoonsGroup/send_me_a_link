SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.NewView extends Backbone.View
  template: HoganTemplates["backbone/templates/group_registrations/new"]

  render: ->
    @$el.html(@template.render())
    return this
