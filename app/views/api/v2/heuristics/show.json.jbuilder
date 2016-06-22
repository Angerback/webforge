json.extract! @heuristic, :id, :name, :description
json.dos do
        json.array!(@dos) do |dos|
            json.extract! dos, :id, :description, :heuristic_id
        end
      end
json.donts do
        json.array!(@donts) do |dont|
            json.extract! dont, :id, :description, :heuristic_id
        end
      end
json.examples do
        json.array!(@examples) do |example|
            json.extract! example, :id, :heuristic_id, :description, :image
        end
      end
json.references do
        json.array!(@references) do |reference|
            json.extract! reference, :id, :heuristic_id, :description, :link
        end
      end
if @heuristica_anterior
  json.heuristica_anterior do
    json.extract! @heuristica_anterior, :id, :name, :description
  end
end
if @heuristica_siguiente
  json.heuristica_siguiente do
    json.extract! @heuristica_siguiente, :id, :name, :description
  end
end
