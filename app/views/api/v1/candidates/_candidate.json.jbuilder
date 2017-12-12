json.id   									candidate.id
json.name							 			candidate.name
json.public_name						candidate.public_name
json.last_name				 			candidate.last_name
json.role_id                candidate.role_id
json.role_title             candidate.role.title

json.role do
	json.value 								candidate.role_id
	json.label 								candidate.role.title

end
