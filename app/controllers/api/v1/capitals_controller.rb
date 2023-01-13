class Api::V1::CapitalsController < ApplicationController
  def show
    country = params[:country]
    capital = CountryFacade.capital_info(country)
    render json: ErrorSerializer.new(404, "Country/capital not found") unless capital
    render json: CapitalSerializer.new(capital) if capital
  end
end
