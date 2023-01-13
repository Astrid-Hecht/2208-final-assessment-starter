class CountryFacade
  def self.capital_info(country)
    raw_capital = CountriesNowService.get_capital_city(country)
    return false if raw_capital == '' || raw_capital.nil?

    capital = raw_capital[:data][:capital]
    return false if capital == '' || capital.nil?
    
    capital_info = GeocodingService.capital_info(capital, country).first
    return false unless capital_info_checker(capital_info)

    Capital.new(capital_info, country)
  end

  private

  def capital_info_checker(capital_info)
    capital_info.is_a?(Hash) && capital_info.keys.includes?(:name) && capital_info.keys.includes?(:latitude) && capital_info.keys.includes?(:longitude)
  end
end
