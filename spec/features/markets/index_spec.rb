require "rails_helper"

RSpec.describe "Market", type: :feature do
  describe "Index Page" do
    it "displays all markets listed with their info", :vcr do
      visit markets_path

      
    end
  end
end