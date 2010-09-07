class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def show
  end
end