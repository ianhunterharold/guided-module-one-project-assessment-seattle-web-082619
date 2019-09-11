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
        puts "Please type in a City to see the Weather, then press enter."
        city_select = STDIN.gets.chomp.strip
        # city_select = Search.new
        # city_select.save

          if search_var = Search.find_by(search_location: city_select)
              Weather.find_by(search_id: Search.id) 
                return Weather.select(:description)
            #type in city, input 
            #weather description associated by search_id match ,output 
            #reference code below for creating a new search
          else 
            puts false 
            puts "That City doesn't exit. Please re-type the city name." 
          end  
          
  
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
          end 

      elsif choice == "4" 
        puts 
        puts "Changing a search record's location. What are you hiding?"
        puts 
        puts "Please type a location you want to change"
        puts  
        choice_select = STDIN.gets.chomp.strip
        change = Search.find_by(search_location: choice_select) 
        if change 
          puts "Please type in the NEW location name. Straight up changing history..."
          choice_new_location = STDIN.gets.chomp.strip
          return change.update(search_location: choice_new_location)
        else 
          puts "Please select 4 again. The ID you typed in doesn't exist."
      end 
        #currently not able to go back to menu, it kicks me out of my program.
        #will work on that in a minute 


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