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

    def update
    if @answer = Answer.find_by(question_id: params[:question_id], test_id: params[:test_id])
      if @answer.update(question_id: params[:question_id], test_id: params[:test_id], )
        if @test.update(grade: params[:grade])
        render json: {
          outcome: "Respuesta actualizada."
        }
      else
        render json: {
          outcome: "Respuesta no actualizada."
        }
      end
    else
      render json: {
        outcome: "Error en respuesta."
      }
    end
  end

  def show
    if params[:question_id]
      if @answer = Answer.find_by(question_id: params[:question_id], test_id: params[:test_id], alternative: params[:alternative])
        render json: {
          outcome: "Ya existe respuesta"
        }
      else
        render json: {
          outcome: "No existe respuesta"
        }
      end
    else
      render json: {
        outcome: "Problemas con respuesta"
      }
    end
  end

  def showTest
    if params[:test_id]
        if @answers = Answer.where( test_id: params[:test_id])
        else
            render json: {
                outcome: "Respuestas no encontradas"
            }
        end
    else
        render json: {
            outcome: "Problemas con respuestas"
        }
    end
  end
end
