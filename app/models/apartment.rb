class Apartment < ApplicationRecord
  belongs_to :user
  validates :city, :user_id, presence: true
end
