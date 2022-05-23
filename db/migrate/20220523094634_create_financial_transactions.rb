class CreateFinancialTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :financial_transactions do |t|
      t.string :name
      t.decimal :amount, precision: 8, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
