class AddCategoryReferenceToTransactions < ActiveRecord::Migration
  def change
    change_table :transactions do |t|
      t.belongs_to :category
    end
    add_index :transactions, :category_id
  end
end
