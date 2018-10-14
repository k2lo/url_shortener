class Link < ApplicationRecord
	before_save :set_urls

	ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a

	# private
	def set_urls
		self.og_url = self.og_url.downcase.gsub(/(https?:\/\/)|(www\.)/, '')
		self.short_url = shorten_url
	end

	def shorten_url
		6.times.map {ALPHABET.sample}.join
	end
end
