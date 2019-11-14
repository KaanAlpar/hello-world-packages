class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @order = Order.new # strong params!(?)
    @order.user = current_user
    @order.package = Package.find(params[:package_id])
    @order.save!
  end

  def show
  end

  private

  def order_params
    # fix the create
    params.require(:order).permit(:user_id, :package_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
