json.message 'Validation Failed'
json.partial! 'api/v1/shared/errors', errors: @candidate.errors
