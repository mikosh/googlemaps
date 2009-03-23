class MapsController < ApplicationController
  include GeoKit::Geocoders
  include GeoKit::Mappable
  layout "start"
  
  def index
  
    loc = IpGeocoder.geocode('91.64.126.237')

    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([50, 10],5)
    if loc.success
      @map.overlay_init GMarker.new([loc.lat, loc.lng],:title => "Hello!")
    end 
    flash[:notice] = loc
  end
end
