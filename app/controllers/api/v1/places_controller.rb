class Api::V1::PlacesController < ApplicationController
  def index
    country = params[:country]
    capital = CountryFacade.capital_info(country)

    render json: ErrorSerializer.new(404, 'Country/capital not found') unless capital

    places = PlacesFacade.tourist_sights(capital.latitude, capital.longitude)

    render json: ErrorSerializer.new(404, 'No places found') unless places

    render json: TouristSightSerializer.new(places) if places
  end

  private

  def coord_checker(lat, long)
    lat.to_f.between?(-90, 90) && long.to_f.between?(-180, 180)
  end
end
