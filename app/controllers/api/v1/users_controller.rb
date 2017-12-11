class API::V1::UsersController < ApplicationController

  skip_before_action :authenticate, only: :profile

  def profile
    @jwt = Auth.decode(params[:token])
    if @jwt
      @user = User.find(@jwt["user"])
      render :show
    else
      render json: { error: 'Usuário não autênticado' }, status: :unauthorized
    end
  end

end
