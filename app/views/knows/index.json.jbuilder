json.array!(@knows) do |know|
  json.extract! know, :id, :name, :descripcion
  json.url know_url(know, format: :json)
end
