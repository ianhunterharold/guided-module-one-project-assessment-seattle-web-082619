class CreateWeathers < ActiveRecord::Migration[5.2]
  #define a change method in which to do the migration
  def change
    create_table :weathers do |t| 
      t.string :description 
      t.string :precipitation
      t.integer :temperature  
      t.integer :search_id  
      t.timestamps
    end
  end

 
end   

