require 'faker'
require 'pry'

User.destroy_all
Search.destroy_all
Weather.destroy_all
UsersSearch.destroy_all

10.times do 
  User.create(name: Faker::Name.unique.name)
end 

10.times do 
  Search.create(search_location: Faker::Address.city)
end 

10.times do 
  Weather.find_or_create_by(description: Faker::Lorem.word, search: Search.all.sample)
end 

10.times do 
  UsersSearch.create(user: User.all.sample, search: Search.all.sample)
end 

binding.pry