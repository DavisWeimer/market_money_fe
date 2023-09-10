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

      expect(page).to have_css(".vendor-name", text: @vendor.name)
      expect(page).to have_css(".contact-info", text: "Contact Info:")
      expect(page).to have_css(".vendor-contact-name", text: @vendor.contact_name)
      expect(page).to have_css(".vendor-phone", text: @vendor.contact_phone)
      expect(page).to have_css(".accepts-credit", text: @vendor.credit_accepted ? "Yes" : "No")
      expect(page).to have_css(".description", text: @vendor.description)
    end
  end
end