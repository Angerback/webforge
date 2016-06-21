class Api::V2::CompositionsController < API::V2::ApiController
  def index
      @compositions = Composition.all
  end
end
