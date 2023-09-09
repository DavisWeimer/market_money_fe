class MarketsFacade
  def self.get_all_markets
    MarketsService.all_markets[:data].map do |market_data|
      Market.new(market_data)
    end
  end
end