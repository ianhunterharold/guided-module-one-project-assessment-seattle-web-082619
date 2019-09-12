require_relative '../config/environment'
require 'pry'
require 'colorize'


class CLI

  def greeting
    puts `clear`
    # puts String.colors
    # puts String.modes 
    puts 'Weather is breezy'.colorize(:light_magenta)
    puts 
    puts 'Weather is cool'.colorize(:black).on_red.underline
    puts 
    puts "Don't get "+"washed".colorize(:light_magenta).italic+" away by too many choices."
    puts 
    puts "~ Select an option below ~"
    puts 
  end 

  def cli_program
    is_running = true 
    while is_running 
      puts "1. Search "+ "Weather".colorize(:cyan)
      puts "2. View Search History"
      puts "3. Delete History"
      puts "4. Change a Search Record"
      puts "5. Exit program"

      choice = STDIN.gets.chomp 

      if choice == "1"
        puts `clear`
        Search.all.each do |search|
          puts "Location: #{search.search_location}"
        end 
        puts
        puts "Please type in a City to see the "+"Weather".colorize(:cyan)+", then press enter" 
        user_input = STDIN.gets.chomp.strip
        #code functioning to this point
        actual_location = Search.find_by(search_location: user_input)
          #given search location in the table, return the coresponding weather feature on weather 
          #save search location
          if weather_description =  Weather.find_by(search_id: actual_location.id)
          
            p "The Weather in #{user_input} is #{weather_description.description}" 
            puts 
            saved_location = Search.create(search_location: user_input)
          else
            puts
            puts `clear`
            saved_location_regardless = Search.create(search_location: user_input)
            puts "That City doesn't exit. Please re-select Search Weather." 
          end 
            is_running = true 
           # binding.pry
        
      elsif choice == "2" 
        puts `clear`
        puts 
        UsersSearch.all.each do |history|
        puts "Name - #{history.user.name} and Location - #{history.search.search_location}" 
        puts 
        end 
        puts "Someone's being drafty..."
        puts 
        
      elsif choice == "3" 
        puts`clear`
        puts "Are you sure you want to delete a specific search? You're being stormy..." 
        puts 
        UsersSearch.all.each do |history|
          puts "ID - #{history.id}, Name - #{history.user.name} and Location - #{history.search.search_location}."  
          end 
          puts 
        puts "Please type in the specific ID you wish to delete"
        puts 
        delete_select = STDIN.gets.chomp.strip
          if UsersSearch.find_by(id: delete_select)
            UsersSearch.delete(delete_select)
            puts 
            puts "You're shady. Like the weather. Get it?"
            puts 
            puts "You have deleted ID #{delete_select}. I hope you're happy."
            puts 
            is_running = true
          else 
            puts 
            puts "Please select 3 again. The ID you typed in doesn't exist."
            puts
          end 

      elsif choice == "4" 
        puts `clear`
        Search.all.each do |search|
          puts "Location: #{search.search_location}"  
          end 
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
            location_on_table.update(search_location: user_new_location)
            puts 
            puts "Your location changed from #{user_picking_location} to #{user_new_location}."
            puts
            puts "That's not sketchy at all..." 
            puts 
          else 
            puts 
            puts "Please select 4 again. The location you typed in doesn't exist."
            puts 
            is_running = true 
        end 

        # kicking me out of the program, want the program to stay up and running while Im still in it - 

      elsif choice == "5"
        puts `clear`
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


