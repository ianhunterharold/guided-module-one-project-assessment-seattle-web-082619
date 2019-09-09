class History < ActiveRecord::Base
belongs_to :users 
belongs_to :searches 
end 