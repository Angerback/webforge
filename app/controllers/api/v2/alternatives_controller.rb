class Api::V2::AlternativesController < API::V2::ApiController
  def index
      @alternatives = Alternative.all
  end
end
