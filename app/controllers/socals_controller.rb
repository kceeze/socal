class SocalsController < ApplicationController
	def index 
		offset = rand(Song.count)
		@song = Song.first(:offset => offset)
	end
end
