class CreateServiceDays < ActiveRecord::Migration[5.1]
	def change
		create_table :service_days do |t|
			t.belongs_to :producer_entity
			t.date :service_date
			t.text :description
			t.string :signup_genius_link
			t.timestamps
		end
	end
end
