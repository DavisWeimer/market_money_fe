class MarketsService
  def self.conn
    @_conn ||= Faraday.new(url: "http://localhost:3000/api/v0" )
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.all_markets
    get_url("markets")
  end

  def self.get_market(id)
    get_url("markets/#{id}")
  end

  def self.all_vendors_for_market(market_id)
    get_url("markets/#{market_id}/vendors")
  end
end