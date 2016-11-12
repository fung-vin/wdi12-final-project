class API::InstagramsController < ApplicationController

  before_action :get_user, only: [:index, :create]

  def index
    # render json: @client.user_recent_media
    render json: @client.media_popular
  end

  def create

  end

private
  def get_user
    auth = JWT.decode cookies[:instagram], ENV['JWT_SECRET'], true, {algorithm: 'HS256'}
    @client = Instagram.client(access_token: auth[0]["token"])
  end
end