class CreateCommands < ActiveRecord::Migration
  def change 
  	create_table :commands do |t|
  		t.text :phrase 

  		t.timestamps
  	end
  end
end
