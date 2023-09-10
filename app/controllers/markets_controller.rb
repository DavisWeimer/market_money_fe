class MarketsController < ApplicationController
  def index
    @markets = MarketsFacade.get_all_markets
  end

  def show
    @market = MarketsFacade.get_a_market(params[:id])
    @market_address = MarketsFacade.readable_address(params[:id])
    @vendors = MarketsFacade.get_all_vendors_for_market(params[:id])
  end
end