class API::FacebooksController < ApplicationController

  before_action :get_user, only: [:index, :create]
  before_action :msg_params, only: [:create]

  def index
    render json: @graph.get_connections("me", "photos")
  end

  def create
    render json: @graph.put_wall_post(msg_params[:facebook_post])
  end

private
  def get_user
    decode = JWT.decode cookies[:facebook], ENV['JWT_SECRET'], true, {algorithm: 'HS256'}
    oauth_access_token = decode[0]["token"]

    @graph =  Koala::Facebook::API.new (oauth_access_token)
  end

  def msg_params
    params.require(:message).permit(:facebook_post)
  end
end
