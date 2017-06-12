class Address < ApplicationRecord
	acts_as_address

	belongs_to :addressable, polymorphic: true
end
