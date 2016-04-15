class Api::V1::UsersController < API::V1::ApiController

	# GET /api/v1/users
	def index
    	@users = User.all
  	end

	# GET /api/v1/users/:rut
	def show
		# Codificación UTF8
		dottedRut = params[:rut].gsub('%2E','.')		
		@user = User.find_by(rut: dottedRut)
	end

end