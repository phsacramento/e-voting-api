json.users @users do |user|
	json.partial! 'user', user: user
end
json.total @total