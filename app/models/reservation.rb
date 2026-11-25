class Reservation < ApplicationRecord
validates :people, presence: true
enum :status, { reserved: 0, cancelled: 1 }
  belongs_to :room
  belongs_to :user
end
