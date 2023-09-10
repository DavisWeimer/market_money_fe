require "rails_helper"

RSpec.describe "Market", type: :feature do
  before do
    @markets_json = MarketsService.all_markets
    @markets = MarketsFacade.get_all_markets
    @market = @markets.last
    @market_address = MarketsFacade.readable_address(@market.id)
    @vendors = MarketsFacade.get_all_vendors_for_market(@market.id)
  end

  describe "Show Page" do
    it "market's name and readable address", :vcr do
      visit market_path(@market.id)

      expect(page).to have_css(".market-name", text: @market.name)
      expect(page).to have_css(".market-address", text: @market_address)

      within ".vendor-list" do
        @vendors.each do |vendor|
          expect(page).to have_css(".vendor-list-item", text: vendor.name)
          expect(page).to have_link(vendor.name, href: vendor_path(vendor.id))
        end
      end
    end
  end
end