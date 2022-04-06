class SuppliesController < ApplicationController
before_action :find_supply, only: [:show, :update, :destroy]

    #GET "/supplies" GET "/parties/:party_id/supplies"
    def index 
        if params[:party_id]
            party = Party.find(params[:party_id])
            render json: party.supplies
        end
    end

    #POST "/parties/:party_id/supplies"
    def create
        if params[:party_id]
            party = Party.find(params[:party_id])
            @supply = party.supplies.create!(supply_params)
            render json: serialized_supply, status: :created
        end
    end

    #POST "/supplies"
    def create
        supply = Supply.create!(supply_params)
        render json: serialized_supply, status: :created
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
        @supply.to_json(inlcude: :party)
    end

    def supply_params
        params.require(:supply).permit(:name, :price, :in_stock)
    end
end