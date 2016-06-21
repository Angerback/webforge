class Api::V2::AnswersController < API::V2::ApiController

  def create
      if params[:question_id]
        @answer = Answer.new(question_id: params[:question_id], test_id: params[:test_id], alternative: params[:alternative])

        if @answer.save
          render json: {
      		    outcome: "Respuesta registrada exitosamente."
      		 }
        else
          render json: {
      		    outcome: "Error al registrar respuesta."
      		 }
        end
      else
        render json: {
            outcome: "Falta especificar pregunta."
         }
       end

  end
end
