require_relative 'config/environment'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = nil
  Pry.start
end

desc 'run cli program'
task :cli do
  cli = CLI.new
  cli.greeting 
  cli.cli_program
end

