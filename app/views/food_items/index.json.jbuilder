json.array! @food_categories do |cat|
	json.id cat.id
	json.label cat.label
	json.image_svg_name cat.image_svg_name
	json.food_items cat.food_items do |item|
		json.id item.id
		json.name item.name
		json.unit_label_singular item.unit_label_singular
		json.unit_label_plural item.unit_label_plural
		json.unit_cost item.unit_cost
		json.description item.description
		json.ingredients item.ingredients
		json.producer_entity item.producer_entity, :name
	end
end
