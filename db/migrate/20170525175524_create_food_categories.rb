class CreateFoodCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :food_categories do |t|
      t.string :label
      t.string :image_svg_name

      t.timestamps
    end
  end
end
