class MarketsController < ApplicationController
  def index
    @markets = MarketsFacade.get_all_markets
  end

  def show
    @market = MarketsFacade.get_a_market(params[:id]).first
    require 'pry'; binding.pry
  end
end