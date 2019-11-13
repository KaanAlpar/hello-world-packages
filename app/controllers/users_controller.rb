class UsersController < ApplicationController
  def show
    @user = current_user
    @countries = Package.select(:origin).distinct.pluck(:origin).sort
  end
end
