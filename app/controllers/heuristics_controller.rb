class HeuristicsController < ApplicationController
  
  def index
  	@heuristics = Heuristic.all
  end

  def show
  	@heuristic = Heuristic.find(params[:heuristic_id])
  	@dos = Do.where(heuristic_id: params[:heuristic_id])
  	@donts = Dont.where(heuristic_id: params[:heuristic_id])
  	@examples = Example.where(heuristic_id: params[:heuristic_id])
  	@references = Reference.where(heuristic_id: params[:heuristic_id])
  end
end
