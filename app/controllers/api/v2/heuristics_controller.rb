class Api::V2::HeuristicsController < API::V2::ApiController

  def index
  	@heuristics = Heuristic.all
  end

  def show

    heuristic_id = Integer(params[:heuristic_id])

  	@heuristic = Heuristic.find(heuristic_id)
  	@dos = Do.where(heuristic_id: heuristic_id)
  	@donts = Dont.where(heuristic_id: heuristic_id)
  	@examples = Example.where(heuristic_id: heuristic_id)
  	@references = Reference.where(heuristic_id: heuristic_id)

    # Esto sirve para encontrar el nombre de las heuristicas anterior y siguiente
    # para mostrarlo como etiqueta de texto en el menu de navegacion inferior

    if heuristic_id < 10
      @heuristica_siguiente = Heuristic.find(heuristic_id+1)
    else
      @heuristica_siguiente = nil
    end

      if heuristic_id > 1
      @heuristica_anterior = Heuristic.find(heuristic_id-1)
    else
      @heuristica_anterior = nil
    end

  end
end
