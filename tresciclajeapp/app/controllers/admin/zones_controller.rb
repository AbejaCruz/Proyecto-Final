class Admin::ZonesController < ApplicationController
  layout 'platform'

  def new
    @zone = Zone.new
  end

  def create
    zone = Zone.new
    zone.name = zone_params[:name] if zone_params[:name]
    zone.city = City.find(zone_params[:city]) if zone_params[:city]
    if zone.save
      redirect_to zones_path
    else
      flash[:zone_errors] = zone.errors
      redirect_to new_zone_path
    end
  end

  def index
    @zones = Zone.all
  end

end

private

def zone_params
  params.require(:zone).permit(:name, :city, :department)
end