class Search < ActiveRecord::Base
has_one :weather
belongs_to :histories 
end 