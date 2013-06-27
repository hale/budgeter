json.array!(@transactions) do |transaction|
  json.extract! transaction, :description, :date, :direction, :amount
  json.url transaction_url(transaction, format: :json)
end
