require "rails_helper"

RSpec.describe "Vendor", type: :feature do
  before do
    @markets_json = MarketsService.all_markets
    @markets = MarketsFacade.get_all_markets
    @market = @markets.last
    @market_address = MarketsFacade.readable_address(@market.id)
    @vendors = MarketsFacade.get_all_vendors_for_market(@market.id)
    @vendor = @vendors.last
  end

  describe "Show Page" do
    it "displays vendor info", :vcr do
      visit vendor_path(@vendor.id)
      save_and_open_page
      # expect(page).to have_css(".vendor-name", text: @vendor.name)
      # expect(page).to have_css(".vendor-info", text: @vendor.contact_phone)

    end
  end
end