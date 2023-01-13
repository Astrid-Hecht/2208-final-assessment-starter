require 'rails_helper'

RSpec.describe CountryFacade do
  context 'happy path' do
    it '.capital_info' do
      capital = CountryFacade.capital_info('Nigeria')
      expect(capital).to be_an_instance_of(Capital)
    end
  end

  context 'sad path' do
    it 'returns false on invalid country' do
        capital = CountryFacade.capital_info('Glorbiglorb')
        expect(capital).to be(false)
    end
  end
end
