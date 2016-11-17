class WebModule < ActiveRecord::Base
  has_many :users, through: :user_module
end
