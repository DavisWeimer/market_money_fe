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
end