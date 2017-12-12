class API::V1::RolesController < API::V1::BaseController

  def index
    @roles = Role.paginate(:page => params[:page], :per_page => 10)
    @total = @roles.length
  end

  private

    def role_params
      params.require(:role).permit(:title)
    end

    def query_params
      params.permit(:title)
    end

end
