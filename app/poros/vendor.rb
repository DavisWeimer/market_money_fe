class Vendor
  attr_reader :id,
              :name,
              :description,
              :contact_name,
              :contact_phone,
              :credit_accpeted
  def initialize(vendor_data)
    @id = vendor_data[:id].to_i
    @name = vendor_data[:attributes][:name]
    @description = vendor_data[:attributes][:description]
    @contact_name = vendor_data[:attributes][:contact_name]
    @contact_phone = vendor_data[:attributes][:contact_phone]
    @credit_accepted = vendor_data[:attributes][:credit_accepted]
  end
end