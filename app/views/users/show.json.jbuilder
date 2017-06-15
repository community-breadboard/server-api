json.(@user, :email, :first_name, :last_name, :type, :balance)

json.family do
	json.name @user.family.name
end
