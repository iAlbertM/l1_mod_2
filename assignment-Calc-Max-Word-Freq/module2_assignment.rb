#Implement all parts of this assignment within (this) module2_assignment2.rb file
        
#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content)
    @content = content
    # @line_number = line_number
    puts calculate_word_frequency
  end
  # store the text file contents
  def calculate_word_frequency
    counts = Hash.new(0)
    content = content.split("")
    
    content.each do |word|
      word = word.downcase
      counts[word] += 1
    end

    highest_wf_count = 0
    highest_wf_words = []
    
    counts.each do |k,v|
      p highest_wf_count = v.max 
      if v == v.max do
        # p highest_wf_count = v
        p highest_wf_words << k
      end # ./if
    end
    # puts "#{highest_wf_words"} : #{highest_wf_count}"
  end
end
 end
acontent = "This is a really really really cool experiment really
Cute little experiment
Will it work maybe it will work do you think it will it will"

atext = LineAnalyzer.new(acontent)