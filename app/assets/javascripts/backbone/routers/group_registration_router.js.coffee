class SendMeALink.Routers.GroupRegistrationsRouter extends Backbone.Router
  routes:
    "": "new"
    "show_hint": "show_hint"
    "add_email": "add_email"

  show_hint: ->
    # show hint to user

  add_email: ->
    # will be in next page

  new: ->
    @view = new SendMeALink.Views.GroupRegistrations.NewView({model: new SendMeALink.Models.Group})
    $("section.right-column").html(@view.render().el)
