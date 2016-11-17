class API::UsersController < ApplicationController
  before_action :authenticate_user!

  def save_preference
    current_user.assign_attributes(user_params)

    if current_user.save
      head 201
    else
      render json: { errors: current_user.errors.messages }, status: 404
    end
  end

  def get_preference
    render json: current_user.preferences
  end

private
  def user_params
    params.permit(preferences:[])
  end
end
