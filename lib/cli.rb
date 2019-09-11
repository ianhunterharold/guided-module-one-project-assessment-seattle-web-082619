require_relative '../config/environment'
require 'pry'

class CLI

  def greeting
    puts 
    puts 'Weather is neat, weather is cool.'
    puts 
    puts "Don't get washed away by too many choices." 
    puts 
    puts "~ Select an option below ~"
    puts 
  end 

  def cli_program
    is_running = true 
    while is_running 
      puts "1. Search Weather"
      puts "2. View History"
      puts "3. Delete History"
      puts "4. Change a Search Record"
      puts "5. Exit program"

      choice = STDIN.gets.chomp 
      if choice == "1"
        Search.all.each do |search|
          puts "Search Location: #{search.search_location}"
        end 
      
        puts "Please type in a City to see the Weather, then press enter" 
        user_input = STDIN.gets.chomp.strip
        
          if actual_location = Search.find_by(search_location: user_input)
          # search.id == weather.search_id 
          return Weather.first.description 

          saved_location = Search.create(search_location: user_input)
          else
            puts false 
            puts "That City doesn't exit. Please re-select Search Weather." 
          end 
          is_running = true 

          ## STILL NEED THIS TO SPIT OUT MY WEATHER CORRECTLY 
  
      elsif choice == "2" 
        puts 
        puts 
        UsersSearch.all.each do |history|
        puts "User ID: #{history.user_id}, Search ID: #{history.search_id} and it's timestamp: #{history.created_at}" 
        puts 
        puts 
        end 
        puts "Someone's snooping..."
        puts 
      elsif choice == "3" 
        puts "Are you sure you want to delete a specific history? You're being dodgy.." 
        puts 
        UsersSearch.all.each do |history|
          puts "History ID: #{history.id}"  
          end 
          puts 
        puts "Please type in the specific row number you wish to delete"
        puts 
        delete_select = STDIN.gets.chomp.strip
          if UsersSearch.find_by(id: delete_select)
            UsersSearch.delete(delete_select)
            puts 
            puts "You're shady. Like the weather. Get it?"
            puts 
            puts "You have deleted search history #{delete_select}. I hope you're happy."
            puts 
            is_running = true 
          end 

      elsif choice == "4" 
        puts 
        puts "Changing a search record's location. What are you hiding?"
        puts 
        puts "Please type a location you want to change"
        puts  
        user_picking_location = STDIN.gets.chomp.strip
        location_on_table = Search.find_by(search_location: user_picking_location) 
        if location_on_table 
          puts "Please type in the NEW location name. Straight up changing history..."
          user_new_location = STDIN.gets.chomp.strip
          return location_on_table.update(search_location: user_new_location)
        else 
          puts "Please select 4 again. The ID you typed in doesn't exist."
        is_running = true 
        end 
        is_running = true 

#Still kicks me out of the program. Want to stay inside of the program until I tell it to exit.


      elsif choice == "5"
        puts 
        puts "Toodles"
        puts 
        is_running = false 
      else 
        puts 
        puts "Are you familiar with a keyboard?"
        puts 
        puts "Try typing in 1,2,3,4 or..you can leave..."
        puts 
      end 
    end 
  end 



end 