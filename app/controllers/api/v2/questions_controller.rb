class Api::V2::QuestionsController < API::V2::ApiController
  def index
      @questions = Question.all
  end
end
