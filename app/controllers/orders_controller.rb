class OrdersController < ApplicationController
  # def new
  #   @order = Order.new
  # end

  def create
    @order = Order.new(order_params) # strong params!(?)
    if @order.save
      redirect_to user_path(current_user)
    else
      # redirect_to new_order_path
      render  # new.html.erb
    end
  end

  private

  # def order_params
  #   params.require(:order).permit(:)
  # end
end
