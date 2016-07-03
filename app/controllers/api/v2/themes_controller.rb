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
		if params[:email] && params[:titulo]

			usuario = User.find_by email: params[:email]
			Theme.create(title: params[:titulo], content: params[:contenido], user_id: usuario.id, open: true)
		
		 	render json: {
      		    outcome: "Tema creado exitosamente"
      		 }
      	else
      		render json:{
      			outcome: "Falta especificar por lo menos el usuario y titulo"
      		}
      	end
	end

	def create_comment
		if params[:email] && params[:contenido]

			usuario = User.find_by email: params[:email]
			Comment.create(theme_id: params[:id_tema], user_id: usuario.id, contenido: params[:contenido])

			#funcionalidad de notificar via email
      		@theme = Theme.find(params[:id_tema])
      		@comments = Comment.where(theme_id: params[:id_tema])
      		emails = @comments.map { |comments| User.find(comments.user_id).email}
      		Notifier.commentNotify(emails.uniq, @theme, params[:contenido]).deliver_now

			render json: {
				outcome: "Comentario publicado"
			}
		else
			render json: {
				outcome: "Error, no se a creado el comentario"
			}
		end

	end









      	
end








