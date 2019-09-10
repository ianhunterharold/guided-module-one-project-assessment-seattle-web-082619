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

            # I want output to be weather description 
            # where weather search_id = search.id 

            # Weather.description if Search.id == Weather.search_id 
            # puts Weather.description 
            # puts "It is #{Weather.description} in #{city_select}."
            # #want to spit out weather -
          else 
            puts "That City doesn't exit." 
          end  
          
          ## doesnt full work, i need to work on the later half of this section. 
          

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
            puts "You're shady. Like the weather. Get it?"
            puts 
            puts "You have deleted search history #{delete_select}. I hope you're happy."
            puts 
          end 

      elsif choice == "4" 
        puts "Changing a search record. What are you hiding?"
        puts "Please type the search locaiton you want to change"
        puts  
        puts "Come back to changing a search record"


        
        #code to allow them to change a search record 


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