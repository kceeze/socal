class Song < ActiveRecord::Base
	attr_accessible :artist, :title, :audio_file
	mount_uploader :audio_file, SongUploader

	validates :audio_file, presence: true
	validates :title, presence: true
	validates :artist, presence: true

	def store_dir
    	"uploads/song/audio_file/#{self.id}"
  	end

  	def previous_song
  		Song.limit(1).order("id DESC").where("id < ?", id).first
	end

	def next_song
  		Song.limit(1).order("id DESC").where("id > ?", id).first
	end
   
end