class Consumer < User
	has_one :address, as: :addressable
	belongs_to :family
end
