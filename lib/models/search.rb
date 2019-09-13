class Search < ActiveRecord::Base
  has_many :weathers
  has_many :users_searches
  has_many :users, through: :users_searches
end 