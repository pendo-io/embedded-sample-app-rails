class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = []
    10.times { @ingredients << "#{Faker::Food.measurement} of <strong>#{Faker::Food.ingredient}</strong>" }
    @snippet = user_snippet
  end

  def user_snippet
    return nil unless current_user
    snippet = {
      account: {
        id: current_user.account_id,
        name: current_user.account_name,
        is_paying: "true",
        monthly_value: "99.99"
      },
      vendor: {
        id: "bfe23637-04b7-4c1a-972e-232520931520"
      },
      user: {
        full_name: current_user.full_name,
        email: current_user.email,
        id: current_user.id
      },
      return_url: "http://example.com"
    }
    JWT.encode(snippet, ENV["RECEPTIVE_TOKEN"], "HS256")
  end

end
