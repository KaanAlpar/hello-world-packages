class UsersController < ApplicationController
  def show
    @user = current_user
    @countries = ISO3166::Country.all.map { |country| country.name }.sort
  end
end
