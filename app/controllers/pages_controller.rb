class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @countries = Package.select(:origin).distinct.pluck(:origin).sort
  end

  def order_confirmed
    @package = Package.find(params[:package_id])
    Order.create!(user: current_user, package: @package)
  end
end
