class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :bank

      t.timestamps
    end
  end
end
