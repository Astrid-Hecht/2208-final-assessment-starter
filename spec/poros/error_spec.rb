require 'rails_helper'

RSpec.describe Error do
  it 'exists and has attributes' do
    error_code = 404
    error_msg = 'Country not found'

    capital = Capital.new(error_code, error_msg)

    expect(capital).to be_an_instance_of(Error)
    expect(capital.code).to eq(404)
    expect(capital.message).to eq('Country not found')
  end
end
