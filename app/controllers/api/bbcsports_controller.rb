class API::BbcsportsController < ApplicationController
  before_action :get_api, only: [:index]

  def index
    render json: JSON.parse(HTTP.get("https://newsapi.org/v1/articles?source=bbc-sport&sortBy=top&apiKey=" + @key).body)["articles"]
  end

private
  def get_api
    @key = "1034c090dc00405aac9158d74909a58a"
  end
end
