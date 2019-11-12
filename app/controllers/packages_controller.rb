class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params) # strong params!
    if @package.save
      redirect_to package_path(@package)
    else
      # redirect_to new_package_path
      render :new # new.html.erb
    end
  end

  private

  def package_params
    params.require(:package).permit(:name, :price, :origin)
  end
end
