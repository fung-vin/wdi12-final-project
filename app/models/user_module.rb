class UserModule < ActiveRecord::Base
  belongs_to :user
  belongs_to :web_module
end
