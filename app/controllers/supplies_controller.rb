class SuppliesController < ApplicationController
before_action :find_supply, only: [:show, :update, :destroy]

    #GET "/supplies" or GET "/parties/:party_id/supplies"
    def index 
        if params[:party_id]
            party = Party.find(params[:party_id])
            render json: party.supplies
        else
            supplies = Supply.all
            render json: supplies
        end

    end

    #POST "/supplies or "/parties/:party_id/supplies"
    def create
        if params[:party_id]
            party = Party.find(params[:party_id])
            @supply = Supply.create!(supply_params)
            Expense.create(supply: @supply, party: party, quantity: params[:quantity])
            render json: serialized_supply, status: :created
        else
            supply = Supply.create!(supply_params)
            render json: serialized_supply, status: :created
        end
    end


    #GET "/supplies/:id"
    def show 
        render json: serialized_supply
    end

    #PATCH "/supplies/:id"
    def update
        @supply&.update!(supply_params)
        render json: serialized_supply
    end

    #DELETE "/supplies/:id"
    def destroy
        @supply&.destroy
        render json: {message: "Successfully destroyed supply"}
    end

    private

    def find_supply
        @supply = Supply.find(params[:id])
    end

    def serialized_supply
        @supply.to_json(include: [:parties, :expenses])
    end

    def supply_params
        params.require(:supply).permit(:name, :price, :in_stock, :quantity)
    end
end