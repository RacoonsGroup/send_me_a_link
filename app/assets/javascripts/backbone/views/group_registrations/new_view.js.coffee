SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.NewView extends Backbone.View
  template: HoganTemplates["backbone/templates/group_registrations/new"]

  events:
    "input input#group_name":                 "generateSlug"
    "change input#toggle-login-availability": "toggleLoginAvailability"
    "submit #new_group":                      "createGroup"

  render: ->
    @$el.html(@template.render())
    return this

  generateSlug: (e) ->
    login = e.currentTarget.value
    @$el.find("input#group_login").val(URLify(login, 20))

  toggleLoginAvailability: (e) ->
    checked = $(e.currentTarget).is(":checked")
    if checked
      @$el.find("input#group_login").attr "disabled", "disabled"
    else
      @$el.find("input#group_login").removeAttr "disabled"

  createGroup: (e) ->
    e.preventDefault()
    @collection.create(
      name: @$el.find("input#group_name")
      login: @$el.find("input#group_login")
    )
