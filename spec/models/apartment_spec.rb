require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'fake@email.com',
    password: 'password1',
    password_confirmation: 'password1'
  )}

  it 'should validate the city' do
    apartment = user.apartments.create(
      street: '124 Conch St',
      unit: 'A',
      city: nil,
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:city]).to include "can't be blank"
  end
end
