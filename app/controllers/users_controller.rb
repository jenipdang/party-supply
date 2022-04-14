class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]

    #GET "/users"
    def index
        users = User.all
        render json: users
    end

    #POST "/users"
    def create
        @user = User.create!(user_params)
        render json: serialized_user, status: :created
    end

    #GET "/users/:id"
    def show
        render json: serialized_user
    end

    #PATCH "/users/:id"
    def update
        @user&.update!(user_params)
        render json: serialized_user, status: :accepted
    end

    #DELETE "/users/:id"
    def destroy
        @user&.destroy
        render json: {message: "Sucessfully destroyed user"}
    end


private

    def find_user
        @user = User.find(params[:id])
    end

    def serialized_user
        @user.to_json(except: [:created_at, :updated_at, :password_digest])
    end

    def user_params
        params.permit(:name, :email, :password)
    end

end