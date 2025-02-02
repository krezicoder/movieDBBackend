class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request!

  def authenticate_user
    user = User.find_for_database_authentication(email: params[:username])
    if user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  def sign_up
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], :email => params[:email], :password => params[:password])
    if user.valid?
      if user.save
        render json: payload(user)
      else
        render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
      end
    else
        render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end


  private

  def payload(user)
    return nil unless user and user.id
    {
        jwt: JsonWebToken.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
    }
  end
end