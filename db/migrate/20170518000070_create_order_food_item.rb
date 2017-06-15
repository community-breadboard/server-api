class CreateOrderFoodItem < ActiveRecord::Migration[5.1]
	def change
		create_table :order_food_items do |t|
			t.belongs_to :order
			t.belongs_to :sellable_food_item
			t.integer :quantity
			t.float :unit_cost
		end
	end
end
