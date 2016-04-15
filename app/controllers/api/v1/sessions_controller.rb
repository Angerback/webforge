class Api::V1::SessionsController < API::V1::ApiController

	#POST /api/v1/sessions/:rut
	def create
		# Codificación UTF8
		dottedRut = params[:rut].gsub('%2E','.')		
		if @user = User.find_by(rut: dottedRut)
			if @user.valid_password?(params[:password])
				head :ok
			else
				head :unprocessable_entity
			end
		else
			head :not_found
		end
	end

end