class MarketsController < ApplicationController
  def index
    @markets = MarketsFacade.get_all_markets
  end

  def show
    
  end
end