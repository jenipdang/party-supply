class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :party, null: false, foreign_key: true
      t.references :supply, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
