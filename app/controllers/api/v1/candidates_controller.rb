class API::V1::CandidatesController < API::V1::BaseController

  def index
    @candidates = Candidate.paginate(:page => params[:page], :per_page => 10)
    @total = @candidates.length
  end

  def grouped
    
  end

  private

    def candidate_params
      params.require(:candidate).permit(:name, :last_name, :public_name, :role_id, :role)
    end

    def query_params
      params.permit(:name)
    end
end
