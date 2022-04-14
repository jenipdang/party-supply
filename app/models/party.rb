class Party < ApplicationRecord
    has_many :expenses, dependent: :destroy
    has_many :supplies, through: :expenses
    belongs_to :host, class_name: "User", foreign_key: :user_id
    
    has_many :invitations
    has_many :guests, through: :invitations, source: :guest

    validates :guest_list, :datetime, :location, presence: true
    validates :name, presence: true, uniqueness: true
    validates :datetime, comparison: { greater_than: DateTime.now }


    #total_cost (calculates the party final cost based on the supplies purchased)
    def total_cost
        self.supplies.sum(:price) * self.expenses.sum(:quantity)
    end

	#most_expensive_supply (find and return the most expensive supply associated with a party)
    def most_expensive_supply
        self.supplies.order("price DESC").first
    end

    # .next_party_lined_up (find the next party based on its datetime and the current date)
    def self.next_party_lined_up
       self.where("datetime > ?", Date.now)
    end

	#.most_supplies (find the party with the most supplies associated)
    def self.most_supplies
        self.preload(:supplies).all.max_by {|party| party.supplies.length}
    end

end