class CreateFoodItems < ActiveRecord::Migration[5.1]
	def change
		create_table :food_items do |t|
			t.string :name
			t.string :unit_label_singular
			t.string :unit_label_plural
			t.float :unit_cost
			t.text :description
			t.string :ingredients
			t.string :image
			t.integer :availability_start_month
			t.integer :availability_start_day
			t.integer :availability_end_month
			t.integer :availability_end_day
			t.references :food_category, foreign_key: true
			t.references :producer_entity, foreign_key: true
			t.references :aggregator
			t.timestamps
		end
	end
end
