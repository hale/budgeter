module StringExtensions
  def truncate(by: 10)
    by > length ? first(by) : self
  end
end

class String
  include StringExtensions
end
