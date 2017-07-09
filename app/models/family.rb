class Family < ApplicationRecord
	has_one :address, as: :addressable
	has_many :consumers
	belongs_to :producer_entity
	belongs_to :family_group, optional: true
	belongs_to :order_pickup_schedule
end
