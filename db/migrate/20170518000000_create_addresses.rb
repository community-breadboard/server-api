class CreateAddresses < ActiveRecord::Migration[5.1]
	def change
		create_table :addresses do |t|
			t.references :addressable, polymorphic: true, index: true
			t.string :name
			t.string :street
			t.string :street2
			t.string :city
			t.string :state
			t.string :zip_code
			t.decimal :latitude, precision: 15, scale: 10
			t.decimal :longitude, precision: 15, scale: 10
			t.text :verification_info
			t.text :original_attributes

			t.timestamps
		end
	end
end
