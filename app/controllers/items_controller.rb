class ItemsController < ApplicationController
  before_action :set_package, only: [:create, :new]
  before_action :set_item, only: [:show]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.package = @package
    if @item.save
      redirect_to package_path(params[:package_id])
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :photo)
  end

  def set_package
    @package = Package.find(params[:package_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
