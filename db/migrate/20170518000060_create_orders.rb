class CreateOrders < ActiveRecord::Migration[5.1]
	def change
		create_table :orders do |t|
			t.belongs_to :user
			t.belongs_to :order_pickup_schedule
			t.float :total_cost
			t.string :status
			t.date :date_placed

			t.timestamps
		end
	end
end
