class CommandsController < ApplicationController
	def index 
		@commands = Command.page(params[:page]).per(10) 
	end

	def new
		@command = Command.new
	end

	def create 
		@command = Command.new(params[:command])
		if @command.save 
			flash[:notice] = "Command created successfully"
			redirect_to @command
		else
			render :new
		end
	end

	def edit 
		@command = Command.find(params[:id])
	end

	def update 
		@command = Command.find(params[:id])
		if @command.update_attributes(params[:command])
			flash[:notice] = "Command successfully updated"
			redirect_to @command
		else
			render :edit
		end
	end

	def show
		@command = Command.find(params[:id])
	end
end
