class CreateUsers < ActiveRecord::Migration[5.2]
  #define a change method in which to do the migration
  def change
    create_table :users do |t| 
      t.string :name
      t.timestamps 
    end
  end


  
end