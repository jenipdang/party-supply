class User < ApplicationRecord
    has_many :invitations_sent, class_name: "Invitation", dependent: :destroy
    has_many :invitations_received, foreign_key: :guest_id, class_name: "Invitation", dependent: :destroy
    
    has_many :hosted_parties, foreign_key: :user_id, class_name: "Party", dependent: :destroy
    
    has_many :parties_attended, -> { where("attended = true")}, through: :invitations_received, source: :party
    has_many :party_invites, -> { where("attended = false")}, through: :invitations_received, source: :party

    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {minimum: 5}, allow_nil: true, on: [:update]
    
end
