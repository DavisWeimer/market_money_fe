require "rails_helper"

RSpec.describe "Market", type: :feature do
  before do
    @markets_json = MarketsService.all_markets
    @markets = MarketsFacade.get_all_markets
  end
  describe "JSON" do
    it "response is correct!", :vcr do
      @markets_json[:data].each do |market|
        expect(market).to have_key(:id)
        expect(market[:id]).to be_an(String)
    
        expect(market).to have_key(:type)
        expect(market[:type]).to be_an(String)
    
        expect(market).to have_key(:attributes)
        expect(market[:attributes]).to be_an(Hash)
    
        expect(market[:attributes]).to have_key(:city)
        expect(market[:attributes][:city]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:county)
        expect(market[:attributes][:county]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:lat)
        expect(market[:attributes][:lat]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:lon)
        expect(market[:attributes][:lon]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:state)
        expect(market[:attributes][:state]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:street)
        expect(market[:attributes][:street]).to be_an(String).or be_nil
    
        expect(market[:attributes]).to have_key(:vendor_count)
        expect(market[:attributes][:vendor_count]).to be_an(Integer).or be_nil
    
        expect(market[:attributes]).to have_key(:zip)
        expect(market[:attributes][:zip]).to be_an(String).or be_nil
      end
    end
  end
  describe "Index Page" do
    it "displays all markets listed with their info", :vcr do
      visit markets_path

      expect(page).to have_selector("h1", text: "Markets")
      expect(page).to have_selector("table")
      expect(page).to have_selector("tr", count: 847) 

      @markets_json[:data] do |market|
        expect(page).to have_selector("td", text: market[:attributes][:name])
        expect(page).to have_selector("td", text: market[:attributes][:city])
        expect(page).to have_selector("td", text: market[:attributes][:state])
        expect(page).to have_selector("a", text: "View Details")
      end
    end

    it "link redirects to markets show page", :vcr do
      market = @markets.first
      visit markets_path

      within "#market_#{market.id}" do
        click_button "View Details"
      end
      expect(current_path).to eq(market_path(market.id))
    end
  end
end