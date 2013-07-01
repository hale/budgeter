class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  monetize :budget_pennies, :numericality => { :greater_than => 0 }

  has_many :transactions
end
