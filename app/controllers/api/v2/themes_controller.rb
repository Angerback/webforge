class Api::V2::ThemesController < API::V2::ApiController
		#GET THEMES
	def index
		@themes = Theme.all
		@authors = Hash.new
		@themes.each do |item|
			@authors[item.id] = User.find(item.user_id)
		end
	end

	def show
		@tema = Theme.find(params[:id])
		@autor = User.find(@tema.user_id)
		@autor_c = Hash.new
		@comentarios = Comment.where(theme_id: params[:id])
		@comentarios.each do |item|
			@autor_c[item.id]  = User.find(item.user_id)
		end
	end

      	
end








