require 'rails_helper'

RSpec.describe "Apartments", type: :request do

  # persistent user 
  let(:user) { User.create(
    email: 'spongey@email.com',
    password: 'password1',
    password_confirmation: 'password1'
  )}

  # index API endpoint
  describe "GET /index" do
    # all attributes
    it 'returns all the apartments' do
      # provide an apartment instance
      apartment = user.apartments.create(
        street: '124 Conch St',
        unit: 'A',
        city: 'Bikini Bottom',
        state: 'CA',
        square_footage: 2000,
        price: '2000',
        bedrooms: 3,
        bathrooms: 2,
        pets: 'yes',
        image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D'
      )
      # http request
      get '/apartments'

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)

      # p "apartment: ", apartment

      # make assertions about the payload
      expect(apartment.first['state']).to eq 'CA'
      # make assertions about the status code
      expect(response).to have_http_status(200)
    end
  end

  # create API endpoint
  describe "POST /create" do
    # all attributes
    it 'saves a valid entry into the database' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch St',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '4000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)

      # p "apartment: ", apartment

      # make assertions about the payload
      expect(apartment['state']).to eq 'CA'
      # make assertions about the status code
      expect(response).to have_http_status(200)
    end

    # missing attributes
    it 'does not save an entry missing a street' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: nil,
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '4000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['street']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing a unit' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: nil,
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '4000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['unit']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing a city' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: nil,
          state: 'CA',
          square_footage: 3000,
          price: '4000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['city']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing a state' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: nil,
          square_footage: 3000,
          price: '4000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['state']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing a square_footage' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: nil,
          price: '4000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['square_footage']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing a price' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: nil,
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['price']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing a bedrooms' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '$5000',
          bedrooms: nil,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['bedrooms']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end    

    it 'does not save an entry missing a bathrooms' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '$5000',
          bedrooms: 2,
          bathrooms: nil,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['bathrooms']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing pets' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '$5000',
          bedrooms: 2,
          bathrooms: 2,
          pets: nil,
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      # p "create apartment: ", apartment

      # payload
      expect(apartment['pets']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing an image' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '$5000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: nil,
          user_id: user.id
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      p "create apartment: ", apartment

      # payload
      expect(apartment['image']).to include "can't be blank"
      # status code
      expect(response).to have_http_status 422
    end

    it 'does not save an entry missing an user' do
      # provide an apartment instance
      apartment_params = {
        apartment: {
          street: '124 Conch Rd',
          unit: 'A',
          city: 'Bikini Bottom',
          state: 'CA',
          square_footage: 3000,
          price: '$5000',
          bedrooms: 2,
          bathrooms: 2,
          pets: 'no',
          image: 'https://images.unsplash.com/photo-1680842350641-d49b43d71025?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNwb25nZWJvYnxlbnwwfHwwfHx8MA%3D%3D',
          user_id: nil
        }
      }

      # http request
      post '/apartments', params: apartment_params

      # abstract the payload from the response that has the content that is requested
      apartment = JSON.parse(response.body)
      p "create apartment: ", apartment

      # payload
      expect(apartment['user_id']).to include "can't be blank"
      expect(apartment['user']).to include "must exist"
      # status code
      expect(response).to have_http_status 422
    end

  end
end
