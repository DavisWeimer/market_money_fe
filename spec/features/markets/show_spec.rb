require "rails_helper"

RSpec.describe "Market", type: :feature do
  before do
    @markets_json = MarketsService.all_markets
    @markets = MarketsFacade.get_all_markets
    @market = @markets.last
    @vendors = MarketsFacade.get_all_vendors_for_market(@market.id)
  end

  describe "Show Page" do
    it "market's name and readable address", :vcr do
      visit market_path(@market.id)
      save_and_open_page
      # expect(page).to have_css(".market-name", text: "14&U Farmers' Market")
      # expect(page).to have_css(".market-address", text: "1400 U Street NW , Washington, District of Columbia 20009")

    end
  end
end