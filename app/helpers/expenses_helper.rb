module ExpensesHelper
  def pretty_date date
    case date.to_date
      when Date.today then "Today"
      when Date.yesterday then "Yesterday"
      else date.strftime("%a #{date.day.ordinalize}")
    end
  end
end
