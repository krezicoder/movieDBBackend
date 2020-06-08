class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def logged_in_user
    if @current_user
      render json: @current_user
    end
  end

  def show
    render json: @user
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end