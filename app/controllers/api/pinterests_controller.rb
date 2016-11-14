class API::PinterestsController < ApplicationController

  before_action :get_user, only: [:index]

  def index
    render json: @client.get_pins
  end
private
  def get_user
    # auth = JWT.decode cookies[:twitter], ENV['JWT_SECRET'], true, {algorithm: 'HS256'}

    @client = Pinterest::Client.new("AeZGPCpqKzpMYqWZz4JCTcA6gd6EFIaU9pYYa4tDjKDoigBHygAAAAA")
  end
end
