class PackagesController < ApplicationController
  def index
    @packages = Package.where(origin: params[:search][:countries])
    @search_country = params[:search][:countries]
  end

  def my_packages
    @packages = Package.where(user: current_user)
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
    @countries = ISO3166::Country.all.map { |country| country.name }.sort
  end

  def create
    @package = Package.new(package_params) # strong params!
    array = @package.name.split(' ')
    new_name = array.map do |name|
      name.capitalize!
    end.join(' ')
    @package.name = new_name
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
