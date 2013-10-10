require "spec_helper"

def fill_in_fields type
	fill_in :song_artist, with: "Artist"

	if type == "new"
		fill_in :song_title, with: "Title"
		path = File.join("uploadedFiles/", "button.mp3")
		attach_file("song_audio_file", path)
	else
		fill_in :song_title, with: "Song"
	end
	click_on "Save"
end

def add_new_song
	visit "http://www.example.com/songs"
	current_url.should == "http://www.example.com/songs"
	click_on "Add New Song"
end

def get_song
	add_new_song
	fill_in_fields "new"
	Song.first
end

feature "CRUD" do 
	scenario "should create song" do
		add_new_song
		fill_in_fields "new"
	end

	scenario "should edit song and check filepath" do 
		song = get_song
		visit "http://www.example.com/songs/#{song.id}/edit"
		fill_in_fields "edit"
		song.reload
		song.title.should == "Song"
		song.store_dir.should == "uploads/song/audio_file/#{song.id}"
	end

	scenario "should delete song" do 
		# song = get_song
		# visit "http://www.example.com/songs/#{song.id}"
		# storage_location = song.audio_file #{}"public/uploads/song/audio_file/#{song.id}"
		# song_id = song.id
		# click_on "Delete"
		# File.exist?("public/uploads/song/audio_file/#{song_id}").should == false
		# song = Song.find(song_id)
		# song.present?.should == false 
	end
end