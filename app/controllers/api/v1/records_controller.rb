class Api::V1::RecordsController < API::V1::ApiController

	# GET /api/v1/records/:owner_id
	def index
		@records = Record.where(owner_id: params[:owner_id])
	end

end
