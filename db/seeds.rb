require 'faker'
require 'pry'

User.destroy_all
Search.destroy_all
Weather.destroy_all
UsersSearch.destroy_all

20.times do 
  User.create(name: Faker::Name.unique.name)
end 

20.times do 
  Search.create(search_location: Faker::Address.city)
end 

20.times do 
  Weather.find_or_create_by(description: Faker::Lorem.word, search: Search.all.sample)
end 

20.times do 
  UsersSearch.create(user: User.all.sample, search: Search.all.sample)
end 

