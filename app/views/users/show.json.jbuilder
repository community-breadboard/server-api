json.(@user, :email, :first_name, :last_name, :type, :balance)

json.family do
	json.name @user.family.name

	json.family_group do
		json.name @user.family.family_group.name
	end
end
