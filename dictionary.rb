class Dictionary

	def initialize(file)
        file_content = IO.read(file)
		@array_of_words = file_content.split("\n")		
    end

    def get_random_word
    	random_word = @array_of_words.sample
    	while !((random_word.size > 5) && (random_word.size < 12))
    		random_word = @array_of_words.sample
    	end
    	random_word	
    end
    
end

