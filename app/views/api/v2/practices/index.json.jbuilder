json.array!(@practices) do |practice|
json.extract! practice, :id, :name, :description, :plunk, :embed
end
