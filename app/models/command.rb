class Command < ActiveRecord::Base
	attr_accessible :phrase
	validates :phrase, presence: true, uniqueness: true

	def remove_special_characters
		self.phrase.gsub(/[^0-9A-Za-z]/, ' ').squeeze(" ").strip
	end

	def phrase_to_api_sound
		phrase = self.remove_special_characters.gsub(" ", "+")
		phrase = "http://tts-api.com/tts.mp3?q=#{phrase}"
	end
end
