json.array!(@incomes) do |income|
  json.extract! income, :amount, :name, :date
  json.url income_url(income, format: :json)
end
