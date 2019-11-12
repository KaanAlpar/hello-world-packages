class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params) # strong params!(?)
    if @order.save
      redirect_to user_path(current_user)
    else
      # try again
      redirect_to package_path(params[:id])
    end
  end

  private

  def order_params
    # fix the create
    params.require(:order).permit(:user_id, :package_id)
  end
end
