class Room < ApplicationRecord
  #名前・定員は埋める必要がある。
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_per_30min, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :reservations, dependent: :destroy
end
