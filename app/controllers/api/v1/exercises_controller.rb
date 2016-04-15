class Api::V1::ExercisesController < API::V1::ApiController

	# POST /api/v1/users/:user_id/practices/:practice_id
	def create
		@exercise = Exercise.where(user_id: params[:user_id],
								   practice_id: params[:practice_id])
		if @exercise
			if @exercise.update(codepen: params[:codepen], embed: params[:embed])
				head :created
			else
				head :unprocessable_entity
			end
		else
			@exercise = Exercise.new(user_id: params[:user_id],
								     practice_id: params[:practice_id],
								     codepen: params[:codepen],
								     embed: params[:embed])
			if @exercise.save
				head :created
			else
				head :unprocessable_entity
			end
		end
	end
end