class PackagesController < ApplicationController

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params) # strong params!
    @package.user = current_user
    if @package.save
      redirect_to package_path(@package)
    else
      # redirect_to new_package_path
      render :new # new.html.erb
    end
  end

  private

  def package_params
    params.require(:package).permit(:name, :price, :origin, :photo)
  end
end
