class API::WeathersController < ApplicationController
  before_action :get_api, only: [:index]

  def index
    render json: JSON.parse(HTTP.get("http://api.openweathermap.org/data/2.5/forecast/city?id=1819729&APPID=" + @key).body)["list"]
  end

private
  def get_api
    @key = "c0e96f8f2e94df398cfad59fa7f82c44"
  end
end
