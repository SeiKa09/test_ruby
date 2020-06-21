class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :account, index: true, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2
      t.string :transaction_type

      t.timestamps
    end
  end
end
