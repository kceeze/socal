require "spec_helper"

feature "create command" do 

	scenario "creating a command" do 
		visit "http://www.example.com/commands"
		current_url.should == "http://www.example.com/commands"
		click_on "Add New Command"
		fill_in :command_phrase, with: "This is a new command"
		click_on "Save"	
		page.should have_content "Command created successfully"
	end
end

describe "Creating Commands" do
	it "should have a uniuqe command" do 
		@command = FactoryGirl.create(:command)
		FactoryGirl.build(:command).should_not be_valid
	end

	it "should remove all special characters" do 
		@command = FactoryGirl.create(:command, phrase: "This is & a command + + & to say * what i need")
		phrase = @command.remove_special_characters
		special_characters = ["&", "+", "*"]
		special_characters.each do |s|
			phrase.should_not include(s)
		end
	end

	it "should convert the command to api form" do
		@command = FactoryGirl.create(:command, phrase: "This is & a command + + & to say * what i need")
		phrase = @command.phrase_to_api_sound
	end

end
