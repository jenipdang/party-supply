class CreateSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :supplies do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.boolean :in_stock

      t.timestamps
    end
  end
end
