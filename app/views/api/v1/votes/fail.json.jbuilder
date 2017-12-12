json.message 'Validation Failed'
json.partial! 'api/v1/shared/errors', errors: @vote.errors
