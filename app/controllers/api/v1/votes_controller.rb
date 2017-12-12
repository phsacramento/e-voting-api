class API::V1::VotesController < API::V1::BaseController

  def create
    @vote = Vote.new
    @candidate = Candidate.find(params[:candidate_id])
    @user = User.find(params[:user_id])
    @vote.user_id = @user.id

    @vote.candidate_id = @candidate.id
    @vote.role_id = @candidate.role.id

    if @vote.save
      render :success, status: 201
    else
      render :fail, status: 422
    end
  end

  def check
    Vote.where(user_id: params[:user_id], role_id: params[:role_id]).present?
  end

end
