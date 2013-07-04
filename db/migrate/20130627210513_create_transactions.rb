class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :direction

      t.timestamps
    end
    add_money :transactions, :amount
  end
end
