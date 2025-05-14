class UsersController < ApplicationController

    allow_unauthenticated_access only: %i[ new create ]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to new_session_path, notice: "Usuario creado correctamente."
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email_address, :password)
    end
end