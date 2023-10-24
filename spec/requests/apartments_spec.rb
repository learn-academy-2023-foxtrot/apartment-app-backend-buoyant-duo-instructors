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
end
