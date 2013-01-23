SendMeALink.Views.GroupRegistrations ||= {}

class SendMeALink.Views.GroupRegistrations.NewView extends Backbone.View
  template: HoganTemplates["backbone/templates/group_registrations/new"]

  events:
    "input input#name":                 "generateSlug"
    "change input#toggle-login-availability": "toggleLoginAvailability"
    "submit #new_group":                      "createGroup"

  render: ->
    @$el.html(@template.render())
    return this

  generateSlug: (e) ->
    login = e.currentTarget.value
    @$el.find("input#slug").val(URLify(login, 20))

  toggleLoginAvailability: (e) ->
    checked = $(e.currentTarget).is(":checked")
    if checked
      @$el.find("input#slug").attr "disabled", "disabled"
    else
      @$el.find("input#slug").removeAttr "disabled"

  createGroup: (e) ->
    e.preventDefault()
    @model.set(
      name: @$el.find("input#name").val()
      slug: @$el.find("input#slug").val()
      owner:
        email: @$el.find("input#email").val()
        password: @$el.find("input#password").val()
      { silent: true }
    )
    @model.save({}, {
      success: => @saved()
      error:   => @failed()
    })
    @$el.find("input").attr "disabled", "disabled"

  saved: ->
    console.log "success"
    console.log @model

    @$el.find(".text-error").each (a, error) ->
      $(error).empty()

    for field, error of @model.attributes.errors
      @$el.find("#"+field+"_error").append(error[0])

    @model.attributes.errors = {}

    @$el.find("#group_name_error").append("error in name")
    @$el.find("input").removeAttr "disabled"

  failed: ->
    console.log "error"
    console.log @model
    @$el.find("input").removeAttr "disabled"
