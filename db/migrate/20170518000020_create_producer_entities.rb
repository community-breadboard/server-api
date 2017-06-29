class CreateProducerEntities < ActiveRecord::Migration[5.1]
	def change
		create_table :producer_entities do |t|
			t.string :name
			t.string :web_site_url
			t.string :offerings
			t.text :description
			t.timestamps
		end
	end
end
