class Market
  attr_reader :name,
              :street,
              :city,
              :county,
              :state,
              :zip,
              :lat,
              :lon,
              :vendor_count


  def initialize(market_data)
    @name = market_data[:name]
    @street = market_data[:street]
    @city = market_data[:city]
    @county = market_data[:county]
    @state = market_data[:state]
    @zip = market_data[:zip]
    @lat = market_data[:lat]
    @lon = market_data[:lon]
    @vendor_count = market_data[:vendor_count]
  end
end