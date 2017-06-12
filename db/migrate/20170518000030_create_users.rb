class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
	  t.belongs_to :consumer_group
	  t.belongs_to :producer_entity
	  t.string :type
      t.string :name
	  t.string :first_name
	  t.string :last_name
	  t.float :balance
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
