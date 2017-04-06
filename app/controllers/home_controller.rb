class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = []
    10.times { @ingredients << "#{Faker::Food.measurement} of <strong>#{Faker::Food.ingredient}</strong>" }
  end

end
