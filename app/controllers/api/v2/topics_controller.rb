class Api::V2::TopicsController < API::V2::ApiController
  def index
    @topics = Topic.all
  end
end
