class Api::V2::CommentsController < API::V2::ApiController
  def index
    @comments = Comment.all
  end
end