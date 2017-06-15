class CreateSellableFoodItems < ActiveRecord::Migration[5.1]
	def change
		create_table :sellable_food_items do |t|
			t.references :seller, index: true, foreign_key: { to_table: :producer_entities }
			t.references :food_item, index: true
			t.float :unit_cost
			t.timestamps
		end
	end
end
