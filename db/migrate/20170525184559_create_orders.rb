class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.float :total_cost
      t.string :status
      t.date :order_start_date
      t.date :order_end_date
      t.date :pickup_start_date
      t.date :pickup_end_date

      t.timestamps
    end
  end
end
