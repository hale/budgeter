json.array!(@expenses) do |expense|
  json.extract! expense, :description, :date, :direction, :amount
  json.url expense_url(expense, format: :json)
end
