json.(@user, :email, :first_name, :last_name, :type, :balance)

json.family do
	json.name @user.family.name

	json.producer_entity do
		json.name @user.family.producer_entity.name
		json.description @user.family.producer_entity.description
		json.web_site_url @user.family.producer_entity.web_site_url
		json.offerings @user.family.producer_entity.offerings
	end
end
