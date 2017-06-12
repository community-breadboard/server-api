class CreateFamilies < ActiveRecord::Migration[5.1]
	def change
		create_table :families do |t|
			t.belongs_to :family_group, optional: true
			t.string :name
			t.timestamps
		end
	end
end
