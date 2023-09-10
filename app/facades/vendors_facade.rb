class VendorsFacade
  def self.get_a_vendor(id)
    VendorsService.get_vendor(id)[:data].map do |vendor_data|
      Vendor.new(vendor_data)
    end.first
  end
end