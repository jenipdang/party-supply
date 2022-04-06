class Expense < ApplicationRecord
  belongs_to :party
  belongs_to :supply
end
