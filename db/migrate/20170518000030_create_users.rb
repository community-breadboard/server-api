class CreateUsers < ActiveRecord::Migration[5.1]
	def change
		create_table :users do |t|
			t.belongs_to :family
			t.belongs_to :producer_entity
			t.string :type
			t.string :first_name
			t.string :last_name
			t.float :balance, :default => 0
			t.string :email
			t.string :password_digest
			t.timestamps
		end
	end
end
