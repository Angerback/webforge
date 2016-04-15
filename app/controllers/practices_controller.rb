class PracticesController < ApplicationController
	before_action :authenticate_user!, only: [:show]	
	
	def index
		@practices = Practice.all
		if current_user
			@exercises = Hash.new 
			@actions = Hash.new
			@practices.each do |practice|
				@exercises[practice.id] = Exercise.where(user_id: current_user.id,
			                         					 practice_id: practice.id).last
				if @exercises[practice.id]
					@actions[practice.id] = "Continuar en Plunker"
				else
					@actions[practice.id] = "Comenzar práctica"
				end
			end
		end
	end

	def show
		@practice = Practice.find(params[:id])
		@exercise = Exercise.where(user_id: current_user.id,
			                       practice_id: @practice.id).last
		@chat = Chat.find_by(user_id: current_user.id)		 
	end
end
