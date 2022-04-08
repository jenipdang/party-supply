class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.datetime :datetime
      t.string :guest_list
      t.string :location

      t.timestamps
    end
  end
end
