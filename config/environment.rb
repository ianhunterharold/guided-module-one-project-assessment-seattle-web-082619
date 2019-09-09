require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_relative '../lib/models/history'
# require_relative '../lib/models/search'
# require_relative '../lib/models/user'
# require_relative '../lib/models/weather'

# require_relative '../db/migrate/001_create_users'
# require_relative '../db/migrate/002_create_searches'
# require_relative '../db/migrate/003_create_weathers'
# require_relative '../db/migrate/004_create_histories'

require_all 'db'
require_all 'lib'





