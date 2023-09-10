class MarketsFacade
  def self.get_all_markets
    MarketsService.all_markets[:data].map do |market_data|
      Market.new(market_data)
    end
  end

  def self.get_a_market(id)
    MarketsService.get_market(id)[:data].map do |market_data|
      Market.new(market_data)
    end
  end

  def self.readable_address(id)
    market = get_a_market(id).first
    address = "#{market.street}, #{market.city}, #{market.state} #{market.zip}"
  end

  def self.get_all_vendors_for_market(market_id)
    MarketsService.all_vendors_for_market(market_id)[:data].map do |vendor_data|
      Vendor.new(vendor_data)
    end
  end
end