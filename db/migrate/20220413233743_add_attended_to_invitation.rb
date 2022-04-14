class AddAttendedToInvitation < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :attended, :boolean
  end
end
