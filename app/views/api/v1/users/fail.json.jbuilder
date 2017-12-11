json.message 'Validation Failed'
json.partial! 'api/v1/shared/errors', errors: @user.errors
