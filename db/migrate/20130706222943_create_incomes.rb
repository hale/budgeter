class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.money :amount
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
