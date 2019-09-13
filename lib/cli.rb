require_relative '../config/environment'
require 'pry'
require 'colorize'


class CLI

  

  def create_user
    puts `clear`
    puts "Please type in your name...then press enter.. I guess..."
    user_name = STDIN.gets.chomp.strip 
    $user = User.find_or_create_by(name: user_name)
  end 
  
  def greeting
    puts `clear`
    puts "Weather is breezy".colorize(:light_magenta)
    puts 
    puts "Weather is cool" 
    puts 
    puts "Don't get "+"washed".colorize(:light_magenta).italic+" away by too many choices."
    puts 
    puts "~ Select an option below "+"#{$user.name}".colorize(:cyan).italic+" ~"
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
        
        actual_location = Search.all.find_by(search_location: user_input)
        

          if actual_location
            weather_description =  Weather.find_by(search_id: actual_location.id)
            puts "The "+"Weather".colorize(:cyan)+" in #{user_input} is "+"#{weather_description.description}".colorize(:cyan)
            puts
            puts "Wasn't expecting that weather, now were you."
            puts 
       
            saved_location = Search.create(search_location: user_input)

            saved_location_in_history = UsersSearch.create(search_id: saved_location.id, user_id: $user.id)
            
          else
            is_running = true            
            puts
            puts `clear`
            puts "That City doesn't have "+"weather.".colorize(:cyan)+" WIERD. Please re-select Search "+"Weather.".colorize(:cyan) 
          end 
            
          
      elsif choice == "2" 
        puts `clear`
        puts 
        UsersSearch.all.each do |history|
          puts "Name - #{history.user.name} and Location - #{history.search.search_location}" 
        puts 
        end 
        puts "Someone's being "+"drafty".colorize(:cyan)+"..."
        puts 

        # writing out my idea 
        # if same user and same search location show up more than 3 times (iterate over searches) 
        # then spit out puts "Notice how actual user is looking at specific location"
  
          # if specific_searches > 5
          #   puts "Looks like someone has been searching #{search.search_location} a lot.."      
          # else
          #   puts "No particular place seems to be of interest to anyone."
          # end  
      elsif choice == "3" 
        puts`clear`
        puts 
        UsersSearch.all.each do |history|
          puts "ID - #{history.id}, Name - #{history.user.name} and Location - #{history.search.search_location}."  
          end 
          puts 
          puts "Are you sure you want to delete a specific search? You're being stormy..." 
          puts 
        puts "Please type in the specific ID you wish to delete"
        puts 
        delete_select = STDIN.gets.chomp.strip
          if UsersSearch.find_by(id: delete_select)
            UsersSearch.delete(delete_select)
            puts 
            puts "You're shady. Like the "+"weather. ".colorize(:cyan)+"Get it?"
            puts 
            puts "You have deleted ID #{delete_select}. I hope you're happy."
            puts 
            is_running = true
          else 
            puts 
            puts "Please select 3 again. The ID you typed in doesn't exist."
            puts
            puts "Try using your eyes and reading the screen for once..."
            puts
          end 

      elsif choice == "4" 
        puts `clear`
        Search.all.each do |search|
          puts "Location: #{search.search_location}"  
          end 
        puts 
        puts "Changing a search record's location. You are hiding something with clout.. get it.."
        puts 
        puts "Please type a location name you want to change"
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
            puts "Please select 4 again - the location you typed in doesn't exist"
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


