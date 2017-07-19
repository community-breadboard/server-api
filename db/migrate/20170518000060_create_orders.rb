class CreateOrders < ActiveRecord::Migration[5.1]
	def change
		create_table :orders do |t|
			t.belongs_to :user
			t.belongs_to :order_pickup_schedule
			t.float :total_cost
			t.datetime :datetime_placed
			t.datetime :next_sale_start_datetime
			t.datetime :next_pickup_date
			t.string :formatted_pickup_time
			t.string :pickup_location_name

			t.timestamps
		end
	end
end
