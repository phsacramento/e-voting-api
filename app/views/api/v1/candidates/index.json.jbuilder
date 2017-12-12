json.candidates @candidates do |candidate|
	json.partial! 'candidate', candidate: candidate
end
json.total @total