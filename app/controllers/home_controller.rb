class HomeController < ApplicationController
  def index
    redirect_to profile_url if current_user
  end
end