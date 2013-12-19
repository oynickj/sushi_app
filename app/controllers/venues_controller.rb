class VenuesController < ApplicationController

  def index
    city = params["city"]
    category_id = params["category_id"]
    venues = Foursquare.find(city, category_id)
    render :json => venues.to_json
  end

end
