class User < ActiveRecord::Base
has_many :histories 
has_many :searches, through: :histories  #maybe not maybe so
end 