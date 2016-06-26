class Api::V2::TestsController < API::V2::ApiController

	def create
		if params[:evaluation_id]
			@test = Test.new(user_id: params[:user_id], evaluation_id: params[:evaluation_id], grade: params[:grade])
			if @test.save
				render json: {
					outcome: "Test registrado exitosamente."
				}
			else
				render json: {
					outcome: "Error al registrar test."
				}
			end
		else
			render json: {
				outcome: "Falta especificar evaluación."
			}
		end	   
	end

	def destroy
		@test = Test.find(params[:id])
		if @test
			@test.destroy
			render json: {
				outcome: "Test borrado exitosamente."
			}
		else
			render json: {
				outcome: "Test no borrado."
			}
		end
		rescue ActiveRecord::RecordNotFound
			render json: {
				outcome: "Test no encontrado."
			}

	end
	
end
