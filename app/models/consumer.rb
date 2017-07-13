class Consumer < User
	belongs_to :family
	has_many :orders
end
