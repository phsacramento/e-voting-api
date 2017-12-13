class API::V1::VotesController < API::V1::BaseController

  def create
    @vote = Vote.new
    @candidate = Candidate.find(params[:vote][:vote][:candidate_id])

    @vote.user_id = @current_user.id

    @vote.candidate_id = @candidate.id
    @vote.role_id = @candidate.role.id

    if @vote.save
      render :success, status: 201
    else
      render :fail, status: 422
    end
  end
  
end

@current_user