class RenameTransactionsToExpenses < ActiveRecord::Migration
  def change
    rename_table :transactions, :expenses
  end
end
