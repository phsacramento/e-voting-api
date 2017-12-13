user 											 = User.new
user.name 								 = "Usuário"
user.surname 							 = "Teste"
user.email 								 = "example@example.org"
user.password 						 = "12345678"
user.password_confirmation = "12345678"
user.cpf									 = "26765731873"

if user.save
	puts "~~> Usuário comum criado!"
end

admin 											 = User.new
admin.name 								   = "Usuário"
admin.surname 							 = "Teste"
admin.email 								 = "admin@example.org"
admin.password 						   = "12345678"
admin.password_confirmation  = "12345678"
admin.cpf									   = "72716610185"
admin.role									 = :admin

if admin.save
	puts "~~> Usuário admin criado!"
end


