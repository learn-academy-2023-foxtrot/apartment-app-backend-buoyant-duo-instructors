require 'rails_helper'

RSpec.describe Apartment, type: :model do
  # persistent user
  let(:user) { User.create(
    email: 'fake@email.com',
    password: 'password1',
    password_confirmation: 'password1'
  )}

  # missing city
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

  # missing street
  it 'should validate the street' do
    apartment = user.apartments.create(
      street: nil,
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:street]).to include "can't be blank"
  end

  # missing unit
  it 'should validate the unit' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: nil,
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:unit]).to include "can't be blank"
  end

  # missing state
  it 'should validate the state' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: nil,
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:state]).to include "can't be blank"
  end

  # missing square_footage
  it 'should validate the square_footage' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: nil,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:square_footage]).to include "can't be blank"
  end

  # missing price
  it 'should validate the price' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: nil,
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:price]).to include "can't be blank"
  end

  # missing bedrooms
  it 'should validate the bedrooms' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: nil,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:bedrooms]).to include "can't be blank"
  end

  # missing bathrooms
  it 'should validate the bathrooms' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: nil,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:bathrooms]).to include "can't be blank"
  end

  # missing pets
  it 'should validate the pets' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: nil,
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg'
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:pets]).to include "can't be blank"
  end

  # missing image
  it 'should validate the image' do
    apartment = user.apartments.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: nil
    )
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:image]).to include "can't be blank"
  end

  # missing user
  it 'should validate the user' do
    apartment = Apartment.create(
      street: '124 Conch Rd',
      unit: 'A',
      city: 'Bikini Bottom',
      state: 'CA',
      square_footage: 2000,
      price: '2000',
      bedrooms: 3,
      bathrooms: 2,
      pets: 'yes',
      image: 'https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg',
      user_id: nil
      )
    
    # p "errors: ", apartment.errors.full_messages
    expect(apartment.errors[:user_id]).to include "can't be blank"
  end

end
