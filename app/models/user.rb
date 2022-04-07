class User < ApplicationRecord
    has_many :invitations
    has_many :host_parties, foreign_key: "user_id", class_name: "Party"
    has_many :parties_invites, through: :invitations, source: :party
end
