class Api::V2::PracticesController < API::V2::ApiController
  def index
      @practices = Practice.all
  end
end
