class Api::V2::EvaluationsController < API::V2::ApiController
	
	#before_action :authenticate_user!, only: [:show, :begin]	
  	
  	def index
		@evaluations = Evaluation.all
	end

	def show
		@evaluations = Evaluation.find(params[:id])
  	end
end
