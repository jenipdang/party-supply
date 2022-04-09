class User < ApplicationRecord
    has_many :invitations
    has_many :host_parties, foreign_key: :user_id, class_name: "Party", dependent: :destroy
    has_many :parties_invites, through: :invitations, source: :party

    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 8..25}
end
