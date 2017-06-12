class Family < ApplicationRecord
	has_many :consumers
	belongs_to :family_group, optional: true
end
