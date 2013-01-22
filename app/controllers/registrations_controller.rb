class RegistrationsController < ApplicationController

  def new
  	@group =  Group.new
  end

end
