#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.SendMeALink =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: (page) ->
    window.SendMeALink.router = switch page
      when "group_registration"
        new SendMeALink.Routers.GroupRegistrationsRouter()
    Backbone.history.start()
