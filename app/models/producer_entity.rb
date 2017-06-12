class ProducerEntity < ApplicationRecord
	has_one :address, as: :addressable
	has_many :producers
end
