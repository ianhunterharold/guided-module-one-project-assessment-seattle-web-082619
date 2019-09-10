class CreateUsersSearches< ActiveRecord::Migration[5.2]
  #define a change method in which to do the migration
  def change
    create_table :users_searches do |t| 
      t.integer :user_id 
      t.integer :search_id  
      t.timestamps 
    end
  end
  

end

