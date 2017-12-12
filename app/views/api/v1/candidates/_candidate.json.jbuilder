json.id   													candidate.id
json.name							 							candidate.name
json.public_name										candidate.public_name
json.last_name				 							candidate.last_name
json.role_id                				candidate.role_id
json.role_title             				candidate.role.title
json.is_voted_by_current_user				candidate.is_voted_by?(current_user)
json.votes_count										candidate.votes.size

json.role do
	json.value 												candidate.role_id
	json.label 												candidate.role.title
end
