json.array!(@heuristics) do |heuristic|
	json.extract! heuristic, :id, :name, :description
end
