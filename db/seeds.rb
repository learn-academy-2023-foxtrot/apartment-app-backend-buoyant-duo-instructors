# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create users
user1 = User.where(email: 'flow@waters.com').first_or_create(password: 'password', password_confirmation: 'password')
user2 = User.where(email: 'flow@rivers.com').first_or_create(password: 'password', password_confirmation: 'password')


# create apartments

apt1 = [
  {
    street: '123 St',
    unit:'A',
    city: 'Waters', 
    state: 'CA',
    square_footage: 1000,
    price: '$3,000',
    bedrooms: 1, 
    bathrooms: 0.5, 
    pets: 'no'
  },
  {
    street: '123 St',
    unit:'B',
    city: 'Waters', 
    state: 'CA',
    square_footage: 500,
    price: '$2,000',
    bedrooms: 1, 
    bathrooms: 1, 
    pets: 'yes'
  }
]

apt2 = [
  {
    street: 'ABC Blvd',
    unit:'1',
    city: 'Rivers', 
    state: 'CA',
    square_footage: 3000,
    price: '$1,000',
    bedrooms: 2, 
    bathrooms: 0.5, 
    pets: 'yes'
  },
  {
    street: 'ABC Blvd',
    unit:'2',
    city: 'Rivers', 
    state: 'CA',
    square_footage: 1500,
    price: '$2,000',
    bedrooms: 1, 
    bathrooms: 2, 
    pets: 'no'
  }
]

apt1.each do |apartment|
  user1.apartments.create(apartment)
  p "creating #{apartment}"
end

apt2.each do |apartment|
  user2.apartments.create(apartment)
  p "creating #{apartment}"
end