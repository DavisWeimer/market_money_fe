class MarketsController < ApplicationController
  def index
    @markets = MarketsFacade.get_all_markets
    require 'pry'; binding.pry
  end
end