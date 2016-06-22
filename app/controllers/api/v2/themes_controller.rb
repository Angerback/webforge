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
	end
end








