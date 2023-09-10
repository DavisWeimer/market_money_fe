class VendorsController < ApplicationController
  def show
    @vendor = VendorsFacade.get_a_vendor(params[:id])
  end
end