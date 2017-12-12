class API::V1::SessionsController < API::V1::BaseController
  skip_before_action :authenticate, only: [:create]

  def create
    @user = User.find_for_database_authentication(auth_params[:login])
    if @user.present? && User.authenticate(@user, auth_params[:password])
      bypass_sign_in(@user)
      warden.set_user(@user)
      jwt = Auth.issue({user: @user.id})
      render json: {jwt: jwt}
    else
      render json: {error: 'Usuário ou senha inválidos'}, status: :unauthorized
    end

  end

  private

    def auth_params
      params.require(:auth).permit(:login, :cpf, :email, :password)
    end

end
