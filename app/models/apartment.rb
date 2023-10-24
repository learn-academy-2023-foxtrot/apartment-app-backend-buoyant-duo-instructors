class Apartment < ApplicationRecord
  belongs_to :user
  validates :city, :street, :unit, :state, :square_footage, :price, :bedrooms, :bathrooms, :pets, :image, :user_id, presence: true
end
