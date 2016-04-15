class ExercisesController < ApplicationController
	before_action :authenticate_user!
	
	# POST /exercises/create
	def create
		@practice = Practice.find(params[:id])
		@exercise = Exercise.new(user_id: current_user.id,
								 practice_id: params[:id],
								 plunk: params[:plunk])
		if @exercise.save
			flash[:success] = "Trabajo registrado satisfactoriamente"
			Chat.create(user_id: current_user.id, 
				         title:"Práctica " + @practice.id.to_s + ": " + @practice.name,
				         practice_id: @practice.id)
			Message.create(user_id: current_user.id,
						   chat_id: Chat.find_by(user_id: current_user.id, 
						   	                     practice_id: @practice.id).id,
						   body: "<p>Comence la práctica " + @practice.name + ', el Plunk de mi trabajo es <a href="' + @exercise.plunk + '">Login</a></p>') 
		else
			flash[:danger] = "No se ha podido registrar tu trabajo"
		end
		redirect_to ({controller: "practices", action: "show", id: params[:id]})
	end

	# POST /exercises/update
	def update
		@exercise = Exercise.where(user_id: current_user.id,
			                       practice_id: params[:id]).last
		if params[:plunk]
			@exercise.update(plunk: params[:plunk])
			flash[:success] = "Enlace a tu trabajo actualizado."
		end
		if params[:embed]
			flash[:success] = "Vista embebida actualizada."
			@exercise.update(embed: params[:embed])
		end 
		redirect_to ({controller: "practices", action: "show", id: params[:id]})		
	end
end

