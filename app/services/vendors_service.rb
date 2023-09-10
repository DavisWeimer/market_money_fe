class VendorsService
  def self.conn
    @_conn ||= Faraday.new(url: "http://localhost:3000/api/v0" )
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_vendor(id)
    get_url("vendors/#{id}")
  end
end