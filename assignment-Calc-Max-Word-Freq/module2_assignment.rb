#Implement all parts of this assignment within (this) module2_assignment2.rb file
        
#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
    # @content = content.downcase.split(" ")
    @content = content
    @line_number = line_number
    puts self.calculate_word_frequency
  end

  def calculate_word_frequency
    highest_wf_words = []
    highest_wf_count = Hash.new(0)
    words = content.split.sort
    words.each do |word|
      word = word.downcase
      highest_wf_count[word] += 1
      # highest_wf_words << word
    end
    highest_wf_count.each do |k, v|
      puts "word: #{k} | occurrences: #{v}"
    end
    # if v == highest_wf_count.max
    print "highest_wf_count: #{highest_wf_count} | highest_wf_words: #{highest_wf_words}"

    # puts "words: #{words}\n | keys: #{highest_wf_count.keys} | values: #{highest_wf_count.values}"

    # highest_wf_count.each { |word| puts "word: #{word}\n | keys: #{highest_wf_count.keys} | values: #{highest_wf_count.values}" }
  end
end

class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers
  def analyze_file(doc)
    lines = []
    File.open(doc) do |text_file|
      lines = text_file.readlines
      puts lines
    end
    
    words = []

    lines.each { |line| words << line }
    puts words

  end
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end

 acontent = "This is a really really really cool experiment really
Cute little experiment
Will it work maybe it will work do you think it will it will"
atext = LineAnalyzer.new(acontent, 1)
# puts atext.calculate_word_frequency
