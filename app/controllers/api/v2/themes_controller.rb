class Api::V2::ThemesController < API::V2::ApiController
  def index
    @themes = Theme.all
  end
end