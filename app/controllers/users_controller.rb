class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]

    #GET "/users"
    def index
        users = User.all
        render json: serialized_user
    end

    #GET "/users/:user_id"
    def show
        user = User.find(params[:id])
        render json: serialized_user
    end

    #PATCH "/users/:user_id"
    def update
        @user&.update!(params[:id])
        render json: serialized_user
    end

    #DELETE "/users/:user_id"
    def destroy
        @user&.destroy
        render json: {message: "Sucessfully destroyed user"}
    end


private

def find_user
    @user = User.find(params[:id])
end

def serialized_user
    @user.to_json(except: [:created_at, :updated_at])
end

# def user_params
#     params.require(:user).permit(:name, :email, :created_at)
# end

end