class ApplicationController < ActionController::API
  
	before_action :authenticate
  before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
				@current_user.current_request_at = DateTime.now
				@current_user.save(validate: false)
        return @current_user
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in? || development?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [:cpf, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
    end

    def development?
      ENV['RACK_ENV'] == 'development'
    end
end
