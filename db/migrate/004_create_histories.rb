class CreateHistories < ActiveRecord::Migration[5.2]
  #define a change method in which to do the migration
  def change
    create_table :histories do |t| 
      t.integer :user_id 
      t.integer :search_id  
      t.timestamps 
    end
  end
  

end

