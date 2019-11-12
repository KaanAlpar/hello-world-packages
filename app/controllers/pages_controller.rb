class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @countries = Package.select(:origin).distinct.pluck(:origin)
  end
end
