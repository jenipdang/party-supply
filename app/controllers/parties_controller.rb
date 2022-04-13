class PartiesController < ApplicationController
    before_action :find_party, only: [:show, :update, :destroy]

    #GET "/parties" 
    def index
        parties = Party.all
        render json: parties
    end

    #POST "/parties"
    def create
        @party = Party.new(party_params)
        @party.datetime = DateTime.strptime(party_params[:datetime], '%Y-%m-%d %H:%M:%S')
        @party.save!
        # @party = Party.create!(party_params)
        render json: serialized_party, status: :created
    end

    #GET "/parties/:id"
    def show
        render json: serialized_party
    end

    #PATCH "/parties/:id"
    def update
        @party&.update!(party_params)
        render json: serialized_party, status: :accepted
    end

    #DELETE "/parties/:id"
    def destroy
        @party&.destroy
        render json: { message: "Successfully destroyed party"}
    end

    private 

    def find_party
        @party = Party.find(params[:id])
    end

    def serialized_party
        @party.to_json(except: [:created_at, :updated_at])
    end

    def party_params
        params.require(:party).permit(:name, :datetime, :guest_list, :location, :user_id)
    end


end