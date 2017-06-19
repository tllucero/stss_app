class StssTradesController < ApplicationController
  before_action :set_stss_trade, only: [:show, :edit, :update, :destroy]

  # GET /stss_trades
  # GET /stss_trades.json
  def index
    @stss_trades = StssTrade.order(:id).page params[:page]
  end

  # GET /stss_trades/1
  # GET /stss_trades/1.json
  def show
  end

  # GET /stss_trades/new
  def new
    @stss_trade = StssTrade.new
  end

  # GET /stss_trades/1/edit
  def edit
  end

  # POST /stss_trades
  # POST /stss_trades.json
  def create
    @stss_trade = StssTrade.new(stss_trade_params)

    respond_to do |format|
      if @stss_trade.save
        format.html { redirect_to @stss_trade, notice: 'Stss trade was successfully created.' }
        format.json { render :show, status: :created, location: @stss_trade }
      else
        format.html { render :new }
        format.json { render json: @stss_trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stss_trades/1
  # PATCH/PUT /stss_trades/1.json
  def update
    respond_to do |format|
      if @stss_trade.update(stss_trade_params)
        format.html { redirect_to @stss_trade, notice: 'Stss trade was successfully updated.' }
        format.json { render :show, status: :ok, location: @stss_trade }
      else
        format.html { render :edit }
        format.json { render json: @stss_trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stss_trades/1
  # DELETE /stss_trades/1.json
  def destroy
    @stss_trade.destroy
    respond_to do |format|
      format.html { redirect_to stss_trades_url, notice: 'Stss trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stss_trade
      @stss_trade = StssTrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stss_trade_params
      params.fetch(:stss_trade, {})
    end
end
