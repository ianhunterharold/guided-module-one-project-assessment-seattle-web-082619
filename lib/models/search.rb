class Search < ActiveRecord::Base
  has_one :weather
  has_many :users_searches
  has_many :users, through: :users_searches
end 