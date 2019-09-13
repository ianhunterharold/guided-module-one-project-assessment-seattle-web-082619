class Search < ActiveRecord::Base
  has_many :weathers
  has_many :users_searches
  has_many :users, through: :users_searches


  #working on more interesting methods that tell you more about your search history database 
#   def specific_searches 
#     Search.all.filter do |search|
#       search.search_location == self 
#     end 
#   location = self.search_location 
#   counting_location = Search.where(search.search_location == ) 
#   counting_location.count 
#   end 
# binding.pry
 
  # figure out location 
  # query data base with same location 
  # counting instances 






end 