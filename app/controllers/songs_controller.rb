class SongsController < ApplicationController
	def index 
		@songs = Song.all
	end

	def new 
		@song = Song.new
	end

	def create 
		@song = Song.new(params[:song])
		if @song.save 
			flash[:notice] = "Song saved successfully"
			redirect_to @song
		else
			render :edit
		end
	end

	def show
		@song = Song.find(params[:id])
	end

	def edit 
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		if @song.update_attributes(params[:song])
			flash[:notice] = "Songs successfully updated"
			redirect_to @song
		else
			render :edit
		end 

	end

	def destroy 
		@song = Song.find(params[:id])
		if @song.delete
			flash[:notice] = "Song deleted successfully"
			redirect_to @song
		else
			render :show
		end
	end


end
