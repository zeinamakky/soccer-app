class User < ActiveRecord::Base
  belongs_to :user_login
  has_many :reviews
end
