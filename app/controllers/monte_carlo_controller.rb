# app/controllers/monte_carlo_controller.rb
class MonteCarloController < ApplicationController
  def new
    @monte_carlo = MonteCarlo.new
  end

  # POST /monte_carlo
  def submit
    puts "posted"
  end

end
