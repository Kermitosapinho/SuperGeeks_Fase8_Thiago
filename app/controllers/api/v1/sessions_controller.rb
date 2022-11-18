class Api::V1::SessionsController < ApplicationController

    def create

        user = User.find_by(email: sessions_param[:email])
        if user && user.valid_password?(sessions_param[:password])
            sign_in user, store: false
            user.generate_authentication_token!
            user.save
            render json: user, status: 200
        else
            render json { errors: "E-mail ou senha inválidos"}, status: 401
        end
    end
    def destroy
        user = User.findy_by(auth_token: params[:id])
        user.generate_authentication_token!
        user.saves
        render json: {}, status: 204
    end

    private
        def sessions_param
            params.require(:session).permit(:email, :password)
end
