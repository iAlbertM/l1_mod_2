# project_name: Calc-Max-Word-Freq
# assignment: Ruby Specialization Module 2 Assignment 
# code by: Albert Martinez
# url: https://ialbertmartinez.com
# email: albertwdd@gmail.com

#Implement all parts of this assignment within (this) module2_assignment2.rb file
class LineAnalyzer
	attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number 

	def initialize(content, line_number)
		@content = content
		@line_number = line_number
		calculate_word_frequency
	end

	def calculate_word_frequency
		@words = Hash.new(0)
		# read comtemt word by word
		@content.downcase.split.each do |word|
			# check if word is not a hash key
			if !@words.include?(word)
				# if not, make word a key with count as its value
				@words[word] = 1
			else
				# if so, increment count value by 1
				@words[word] += 1
			end
		end
		@highest_wf_count = 0
		@highest_wf_words = Array.new
		@highest_wf_count = @words.values.max
		# access all keys and values in hash
		@words.each do |word, count|
			if count > @highest_wf_count
				# set max count to new max value
				@highest_wf_count = count
			elsif count == @highest_wf_count
				# if so, add to array
				@highest_wf_words.push(word)
			end
		end
	end

end

class Solution
	attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  	def initialize
    	@analyzers = []
  	end

  	def analyze_file
    	lines = Array.new
		File.foreach("test.txt").with_index(1) do |read_file, indx|
			@analyzers.push(LineAnalyzer.new(read_file, indx))
		end
  	end
	
	
	def calculate_line_with_highest_frequency 
		@highest_count_across_lines = 0
		@highest_count_words_across_lines = Array.new
		@analyzers.each do |analyzer|
			if analyzer.highest_wf_count > @highest_count_across_lines then
				@highest_count_across_lines = analyzer.highest_wf_count
			end

			if analyzer.highest_wf_count == @highest_count_across_lines then
				@highest_count_words_across_lines << analyzer
			end
		end

	end

	def print_highest_word_frequency_across_lines
		puts "The following words have the highest word frequency per line:\n "
		@highest_count_words_across_lines.each do |analyzer|
    		puts "#{analyzer.highest_wf_words} (appears in line # #{analyzer.line_number})"
		end
	end
end

s = Solution.new
s.analyze_file
s.calculate_line_with_highest_frequency
s.print_highest_word_frequency_across_lines