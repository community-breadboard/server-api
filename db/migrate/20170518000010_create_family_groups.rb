class CreateFamilyGroups < ActiveRecord::Migration[5.1]
	def change
		create_table :family_groups do |t|
			t.belongs_to :producer_entity
			t.string :name
			t.timestamps
		end
	end
end
