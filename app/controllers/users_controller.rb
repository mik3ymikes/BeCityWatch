class UsersController < ApplicationController
    def index
        users=User.all 

        render json:users, status:200
    end

    def show
        user=User.find(params[:id])
        render json:user, status:200
    end

    def create
        user=User.new(user_params)
     
        if user.save
         render json: user, status: :created
        else
         render json: user.errors, status: :unprocessable_entity
        end
       end




       def user_params
        params.permit(:username, :password, :email, :zipcode)
      end
end
