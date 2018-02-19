# app/controllers/monte_carlo_controller.rb
class MonteCarloController < ApplicationController
  before_action :set_monte_carlo, only: [:show, :edit, :update, :destroy]

  # GET /monte_carlo/new
  def new
    @monte_carlo = MonteCarlo.new
#    @monte_carlo = MonteCarlo.new(params[:monte_carlo])
  end

  # POST /monte_carlo
  def create
    @monte_carlo = MonteCarlo.new(monte_carlo_params)
    puts @monte_carlo.runs
    if @monte_carlo.valid?
#      redirect to @monte_carlo, notice: 'Monte_carlo submission success'
      redirect_to action: "show", notice: 'Monte_carlo submission success'
    else
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  private

    def set_monte_carlo
      @monte_carlo = MonteCarlo.new(params[:monte_carlo])
    end

    def monte_carlo_params
      params.fetch(:monte_carlo, {})
    end

end
