class Story_reader
	def read_story
		file = File.open("story.txt", 'r')
		file.readline.each { |line| puts line}
	end
end