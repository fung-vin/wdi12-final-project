class API::WeathersController < ApplicationController
  # before_action :get_city, only: [:index]

  def index
    # render json: OpenWeather::Current.city_id("Berlin", DE, @option)
    render json: weather = RestClient.get "http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID=c0e96f8f2e94df398cfad59fa7f82c44"
  end

private
  def get_city
    @option = { units: "metric", APPID: 'c0e96f8f2e94df398cfad59fa7f82c44' }
    pry
  end
end
