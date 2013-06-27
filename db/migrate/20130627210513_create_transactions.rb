class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :description
      t.datetime :date
      t.string :direction

      t.timestamps
    end
    add_money :transactions, :amount
  end
end
