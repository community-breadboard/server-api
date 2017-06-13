json.(@user, :email, :first_name, :last_name, :type, :balance)

json.family do
	json.name @user.family.name
	json.aggregator do
		json.name @user.family.aggregator.name
	end
	json.family_group do
		json.name @user.family.family_group.name
	end
end
