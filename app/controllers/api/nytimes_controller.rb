class API::NytimesController < ApplicationController
  before_action :get_api, only: [:index]

  def index
    render json: JSON.parse(HTTP.get("https://api.nytimes.com/svc/topstories/v2/home.json?api-key=" + @key).body)["results"]
  end

private
  def get_api
    @key = "a63d96791d6c44068cdd5fccbf267dfe"
  end
end
