class Income < ActiveRecord::Base
  monetize :amount_pennies
end
