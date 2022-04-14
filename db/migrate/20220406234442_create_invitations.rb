class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.references :guest, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
