class Party < ApplicationRecord
    has_many :expenses, dependent: :destroy
    has_many :supplies, through: :expenses

    validates :guest_list, :datetime, :location, presence: true
    validates :name, presence: true, uniqueness: true
    # validates :datetime, comparison: { greater_than: Date.current }
    # validate :validate_future_date

    # def validate_future_date
    #     if !self.datetime.future?
    #         self.errors.add(:datetime, "Date must be in the future") #add errors manually on the object
    #     end
    # end

    #total_cost (calculates the party final cost based on the supplies purchased)
    #supply price * expense quanity 
    def total_cost
        self.supplies.sum(:price) * self.expenses.sum(:quantity)
    end

	#most_expensive_supply (find and return the most expensive supply associated with a party)
    def most_expensive_supply
        self.supplies.order("price DESC").first
    end

    # .next_party_lined_up (find the next party based on its datetime and the current date)
    # def self.next_party_lined_up
    #    self.where(datetime: "datetime > ?", Date.today)
    # end

	#.most_supplies (find the party with the most supplies associated)
    def self.most_supplies
        self.preload(:supplies).all.max_by {|party| party.supplies.length}
    end
    
end
