class ExpensesController < ApplicationController

    def destroy
        expense = Expense.find(params[:id])
        expense.destroy
    end

end
