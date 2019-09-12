# require 'rest client'
# require 'json'
# require 'pry'

# WEATHER = 'https://api.darksky.net/forecast/[key]/[latitude],[longitude]'


# def get_location_weather_data(latitude,longitude)
#   uri = URI("https://api.darksky.net/forecast/[key]/[latitude],[longitude]")
#   all_locations = RestClient.get(uri)
#   location_hash = JSON.parse(all_locations)
#   latitude_data = location_hash["latitude"]
#   longitude_data = location_hash["longitude"]

#   summary_icon_data = location_hash["currently"].each{|data| data["icon"]}
  
#   .
# #   precip_probability_data = location_hash["currently"].each{|data| data["precipProbability"]}
# #   temperature_data = location_hash["currently"].each{|data| data["temperatureHigh"]} 
  

# # return all of that data after fetching it 
# # pull out what we want and then reconstruct it into a hash with the data I want, point it to our variable names that associate with the key value pair 
# # last thing in method it will return that hash that we want 
# # location.data = get weather then we can inject the data into what we want 

# # return to API fun this afternoon. 
# # end 




