module ExpensesHelper
  def pretty_date date
    if date == Date.today
      "Today"
    elsif date == Date.yesterday
      "Yesterday"
    #elsif 5.days.ago < date
      #"#{(Date.today - date).to_i} days ago"
    else
      date.strftime("%a #{date.day.ordinalize}")
    end
  end
end
