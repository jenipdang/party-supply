class Supply < ApplicationRecord
    has_many :expenses
    has_many :parties, through: :expenses

    validates :name, :price, :in_stock, presence: true
    validates :price, numericality: { other_than: 0 }

    # .most_expensive (find the most expensive supply)
    def self.most_expensive
        self.order("price DESC").limit(1)
    end

    # .reorder_supplies (find a list of all the supplies that are out of stock)
    def self.reorder_supplies
        self.find_by(in_stock: false) || "All supplies are in stock"
    end

    # .most_purchased (find the supply that is associated with the most parties)
    def self.most_purchased
       self.preload(:parties).all.max_by {|supply| supply.parties.length}
        # self.all.max_by {|supply| supply.parties.count}
    end
end
