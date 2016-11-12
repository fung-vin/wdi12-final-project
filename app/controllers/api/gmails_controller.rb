class API::GmailsController < ApplicationController

  before_action :get_user, only: [:index]

  def index
    pry
    render json: @auth
  end

private
  def get_user
    @auth = JWT.decode cookies[:google_oauth2], ENV['JWT_SECRET'], true, {algorithm: 'HS256'}

    gmail = Gmail.connect(:xoauth2, 'xdcc.irc@gmail.com', auth[0]["token"])
  end
end
