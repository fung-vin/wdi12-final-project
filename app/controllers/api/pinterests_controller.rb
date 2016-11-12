class API::PinterestsController < ApplicationController

  before_action :get_user, only: [:index]

  def index
    render json: @client.me
  end

private
  def get_user
    @client = Pinterest::Client.new("Acg4lotOleU2Kckx0QNUfSLTbodYFIZMKLpXxqFDjKDoigBHygAAAAA")
  end
end
