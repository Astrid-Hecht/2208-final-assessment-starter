require 'rails_helper'

RSpec.describe PlacesFacade do
  context 'happy path' do 
    it '.tourist_sights' do
      capital = CountryFacade.capital_info('France')
      sights = PlacesFacade.tourist_sights(capital.latitude, capital.longitude)
      expect(sights).to be_an(Array)
      expect(sights.first).to be_an_instance_of(TouristSight)
    end
  end

  context 'sad path' do
    it 'returns false on invalid coords' do
      sights = PlacesFacade.tourist_sights(1000, -1000)
      expect(sights).to be(false)
    end
  end
end
