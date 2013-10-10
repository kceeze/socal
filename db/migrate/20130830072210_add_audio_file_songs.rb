class AddAudioFileSongs < ActiveRecord::Migration
  def up
  	add_column :songs, :audio_file, :string
  end

  def down
  	remove_column :songs, :audio_file
  end
end
