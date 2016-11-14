class API::FacebooksController < ApplicationController

  before_action :get_user, only: [:index, :create]
  before_action :msg_params, only: [:create]

  def index
    render json: @graph.get_connections("me", "feed")
  end

  def create
    @graph.put_connections("me", "feed", message: msg_params[:fb_msg])

    head 201
  end

private
  def get_user
    auth = JWT.decode cookies[:facebook], ENV['JWT_SECRET'], true, {algorithm: 'HS256'}
    @graph = Koala::Facebook::API.new(auth[0]["token"])
  end

  def msg_params
    params.require(:message).permit(:fb_msg)
  end
end
