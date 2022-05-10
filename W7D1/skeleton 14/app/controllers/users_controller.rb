class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end
    
    def new
       
        render :new
    end

    def edit
        @user = User.find(params[:id])
        render :edit

    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user.id)
        else
            render json: @user.errors.full_messages, status: 422
        end

    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render :show
        else 
          render json: @user.errors.full_messages, status: 422
        end

    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render :index


    end

    def user_params
        params.require(:user).permit(:username, :password)
    end



end
