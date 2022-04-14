class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party
  belongs_to :guest, class_name: 'User', foreign_key: :guest_id
end