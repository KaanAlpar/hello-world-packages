class PackagesController < ApplicationController
  def index
    @packages = []
    @search_country = params[:search][:countries].capitalize
    Country.search(@search_country).each do |search_result|
      @packages += Package.where(origin: search_result.name)
    end
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
    @package.user = current_user
    if @package.save
      redirect_to package_path(@package)
    else
      render :new
    end
  end

  private

  def package_params
    params.require(:package).permit(:name, :price, :origin, :photo, :description)
  end
end
