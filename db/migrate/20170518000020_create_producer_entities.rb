class CreateProducerEntities < ActiveRecord::Migration[5.1]
	def change
		create_table :producer_entities do |t|
			t.string :type
			t.string :name
			t.text :description
			t.string :sale_start_day_of_week
			t.integer :sale_start_hour
			t.integer :sale_start_minute
			t.string :sale_end_day_of_week
			t.integer :sale_end_hour
			t.integer :sale_end_minute
			t.string :pickup_start_day_of_week
			t.integer :pickup_start_hour
			t.integer :pickup_start_minute
			t.string :pickup_end_day_of_week
			t.integer :pickup_end_hour
			t.integer :pickup_end_minute

			t.timestamps
		end
	end
end
