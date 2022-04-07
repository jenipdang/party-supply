class AddUserIdToParty < ActiveRecord::Migration[7.0]
  def change
    add_reference :parties, :user, null: false, foreign_key: true
  end
end
