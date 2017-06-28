class CreateOrderPickupSchedules < ActiveRecord::Migration[5.1]
	def change
		create_table :order_pickup_schedules do |t|
			t.belongs_to :producer_entity
			t.integer :sale_start_day_of_week
			t.integer :sale_start_hour
			t.integer :sale_start_minute
			t.integer :sale_end_day_of_week
			t.integer :sale_end_hour
			t.integer :sale_end_minute
			t.integer :pickup_start_day_of_week
			t.integer :pickup_start_hour
			t.integer :pickup_start_minute
			t.integer :pickup_end_day_of_week
			t.integer :pickup_end_hour
			t.integer :pickup_end_minute

			t.timestamps
		end
	end
end
