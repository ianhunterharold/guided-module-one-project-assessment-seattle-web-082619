require 'faker'
require 'pry'

# User.destroy_all
# Search.destroy_all
# Weather.destroy_all

10.times do 
  User.create(name: Faker::Name.unique.name)
end 

10.times do 
  Search.create(search_location: Faker::Address.city)
end 

10.times do 
  Weather.create(description: Faker::Lorem.word)
end 

