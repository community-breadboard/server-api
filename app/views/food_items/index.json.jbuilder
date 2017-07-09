json.array! @food_categories do |cat|
	json.id cat.id
	json.label cat.label
	json.image_svg_name cat.image_svg_name
	json.food_items cat.food_items do |item|
		if item.sellable_food_items.length > 0
			json.id item.id
			json.name item.name
			json.image item.image
			json.unit_label_singular item.unit_label_singular
			json.unit_label_plural item.unit_label_plural
			json.description item.description
			json.ingredients item.ingredients
			json.unit_cost (item.sellable_food_items).first.unit_cost
			json.producer_entity item.producer_entity, :name
		end
	end
end
