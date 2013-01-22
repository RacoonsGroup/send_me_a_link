SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.NewView extends Backbone.View
  template: HoganTemplates["backbone/templates/group_registrations/new"]

  events:
    "input input#group_name":         "generate_slug"
    "change input#toggle-login-availability": "toggle_login_availability"

  render: ->
    @$el.html(@template.render())
    return this

  generate_slug: (e) ->
    login = e.currentTarget.value
    @$el.find("input#group_login").val(URLify(login, 20))

  toggle_login_availability: (e) ->
    checked = $(e.currentTarget).is(":checked")
    if checked
      @$el.find("input#group_login").attr "disabled", "disabled"
    else
      @$el.find("input#group_login").removeAttr "disabled"
