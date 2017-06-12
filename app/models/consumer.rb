class Consumer < User
	has_one :address, as: :addressable
	belongs_to :consumer_group
end
