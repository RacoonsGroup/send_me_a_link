class SendMeALink.Routers.GroupRegistrationsRouter extends Backbone.Router
  routes:
    "": "new"
    "create": "create"
    "show_hint": "show_hint"
    "add_email": "add_email"

  create: ->
    @view = new SendMeALink.Views.GroupRegistrations.CreateView()
    $("#group_registrations").html(@view.render().el)

  show_hint: ->
    @view = new SendMeALink.Views.GroupRegistrations.ShowHintView()
    $("#group_registrations").html(@view.render().el)

  add_email: ->
    @view = new SendMeALink.Views.GroupRegistrations.AddEmailView()
    $("#group_registrations").html(@view.render().el)

  new: ->
    @view = new SendMeALink.Views.GroupRegistrations.NewView()
    $("section.right-column").html(@view.render().el)
