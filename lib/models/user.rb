class User < ActiveRecord::Base
  has_many :users_searches
  has_many :searches, through: :users_searches 
end 