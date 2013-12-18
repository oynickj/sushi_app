class LocationsController < ApplicationController

  def index
    sushi = Foursquare.find_sushi("New York, NY")
    render :json => sushi.to_json
  end


  def find_sushi_city
    sushi = Foursquare.find_sushi(params["city"])
    render :json => sushi.to_json
  end


  # def show
  #   @location = Location.find(params[:id])
  # end
  #
  # def create
  #   @location = Location.new(params[:location])
  #   if @location.save
  #     render :partial => 'location', :object => @location
  #   end
  # end

end
