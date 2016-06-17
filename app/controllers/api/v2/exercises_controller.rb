class Api::V2::ExercisesController < API::V2::ApiController
	# POST /exercises/create
	def create
		@practice = Practice.find(params[:practice_id])
		@exercise = Exercise.new(exercises_params)
		if @exercise.save
			Chat.create(user_id: params[:user_id],
				         title:"Práctica " + @practice.id.to_s + ": " + @practice.name,
				         practice_id: @practice.id)
			Message.create(user_id: params[:user_id],
						   chat_id: Chat.find_by(user_id: params[:user_id],
						   	                     practice_id: @practice.id).id,
						   body: "<p>Comence la práctica " + @practice.name + ', el Plunk de mi trabajo es <a href="' + @exercise.plunk + '">Login</a></p>')
       render json: {
   		    outcome: "Trabajo registrado exitosamente."
   		 }
		else
      render json: {
        outcome: "No se ha podido registrar tu trabajo."
      }
		end
	end

	# POST /exercises/update
	def update

    if(params[:id])
		    @exercise = Exercise.where(user_id: params[:user_id],
			                       practice_id: params[:practice_id], id: params[:id]).last
    else
        @exercise = Exercise.where(user_id: params[:user_id],
                           practice_id: params[:practice_id]).last
    end

    outcome = ""
		if params[:plunk]
			@exercise.update(plunk: params[:plunk])
			outcome = outcome + "Enlace a tu trabajo actualizado, "
		end
		if params[:embed]
      @exercise.update(embed: params[:embed])
			outcome = outcome + "Vista embebida actualizada, "
		end
    render json: {
      outcome: outcome
    }
	end

  def index
    if(params[:user_id])
      @practices = Practice.all
  		if params[:user_id]
  			@exercises = []
  			@practices.each do |practice|
          exercise = Exercise.where(user_id: params[:user_id],
  			                         					 practice_id: practice.id).last
          if exercise
  				      @exercises.push(exercise)
          end
  			end
  		end
    else
      @exercises = Exercise.where(user_id: params[:user_id])
    end


  end


  private
        # Never trust parameters from the scary internet, only allow the white list through.
      def exercises_params
        params.require(:exercise).permit(:user_id, :practice_id, :plunk, :embed)
      end
end
