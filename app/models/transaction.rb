class Transaction < ActiveRecord::Base
  #attr_accessible :amount, :date, :direction, :description
  validates_presence_of :description, :date, :direction, :amount
  belongs_to :category
  accepts_nested_attributes_for :category

  register_currency :gbp
  monetize :amount_pennies, :numericality => { :greater_than => 0 }

end
