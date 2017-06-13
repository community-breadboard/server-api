class Family < ApplicationRecord
	has_one :address, as: :addressable
	has_many :consumers
	belongs_to :aggregator, :class_name => :Aggregator, :foreign_key => "producer_entity_id"
	belongs_to :family_group, optional: true
end
