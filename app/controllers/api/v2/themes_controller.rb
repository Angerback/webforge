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

	
	def create
		if params[:user_id] && params[:titulo]
			@tema = Theme.create(title: params[:titulo], content: params[:contenido], user_id: params[:user_id], open: true)
		
		 	render json: {
      		    outcome: "Tema creado exitosamente"
      		 }
      	else
      		render json:{
      			outcome: "Falta especificar por lo menos el usuario y titulo"
      		}
      	end
      


	end









      	
end








