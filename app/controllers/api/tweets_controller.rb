class API::TweetsController < ApplicationController
  # before_action :authenticate_user!
  before_action :get_user, only: [:index, :get_self, :create]
  before_action :msg_params, only: [:create]

  def index
    render json: @client.home_timeline
  end

  def create
    render json: {uri: @client.update(msg_params[:tweet]).uri.to_s}
  end

  def get_self
    render json: @client.user
  end

private
  def get_user
    auth = JWT.decode cookies[:twitter], ENV['JWT_SECRET'], true, {algorithm: 'HS256'}

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = auth[0]['token']
      config.access_token_secret = auth[0]['secret']
    end

    if @client.nil?
      render json: "Client not found", status: 404
    end
  end

  def msg_params
    params.require(:message).permit(:tweet)
  end
end
