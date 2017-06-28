class OrderPickupSchedule < ApplicationRecord
  belongs_to :producer_entity
  has_one :address, as: :addressable
end
