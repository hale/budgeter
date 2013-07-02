class Transaction < ActiveRecord::Base
  #attr_accessible :amount, :date, :direction, :description
  validates_presence_of :category, :date, :direction, :amount
  belongs_to :category
  accepts_nested_attributes_for :category

  scope :since, ->(date) { where('date > ?', date) }
  scope :recent, -> { since(7.days.ago).limit(10) }
  scope :month, ->(date) { where(:date => date.beginning_of_month..date.end_of_month) }
  scope :out, -> { where('direction = ?', 'Out') }
  scope :in, -> { where('direction = ?', 'In') }

  register_currency :gbp
  monetize :amount_pennies, :numericality => { :greater_than => 0 }

end
