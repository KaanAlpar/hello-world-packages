class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @countries = ISO3166::Country.all.map {|country| country.name}.sort
  end

  def order_confirmed
    @package = Package.find(params[:package_id])
    Order.create!(user: current_user, package: @package)
  end
end
