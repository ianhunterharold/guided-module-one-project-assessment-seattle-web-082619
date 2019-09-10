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
        puts "Please type in a City to see the Weather"
        city_select = STDIN.gets.chomp.strip
          if Search.find_by(search_location: city_select)
            # Weather.description if Search.id == Weather.search_id 
            puts true 
            # puts "It is #{Weather.description} in #{city_select}."
            # #want to spit out weather -
          else 
            puts "That City doesn't exit." 
          end  
          
          ## doesnt full work, i need to work on the later half of this section. 
          

      elsif choice == "2" 
        puts "Someone's snooping..."
        puts 
        History.all.each do |history|
        puts "User ID: #{history.user_id}, Search ID: #{history.search_id} and it's timestamp: #{history.created_at}" 
        puts 
        end 
      elsif choice == "3" 
        puts "Are you sure you want to delete this history?" 
        puts "Think about it. It's gone forever if you do..."
        #write code that confirms that you are going to delete 
        #all of the search history 
      elsif choice == "4" 
        puts "Changing a search record. What are you hiding?"
        #code to allow them to change a search record 
      elsif choice == "5"
        puts "Toodles"
        is_running = false 
      else 
        puts "Do you know how to work a keyboard?"
        puts "try typing in 1,2,3, or 4..."
      end 
    end 
  end 


end 