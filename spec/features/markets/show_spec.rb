require "rails_helper"

RSpec.describe "Market", type: :feature do
  before do
    @markets_json = MarketsService.all_markets
    @markets = MarketsFacade.get_all_markets
  end

  describe "Show Page" do
    it "market's name and readable address", :vcr do
      market = @markets.first
  
      visit market_path(market.id)

      
    end
  end
end