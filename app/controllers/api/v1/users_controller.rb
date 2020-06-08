class Api::V1::UsersController < ApplicationController
  def logged_in_user
    if @current_user
      render json: @current_user
    end
  end
end