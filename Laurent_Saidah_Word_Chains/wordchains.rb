require "set"
class Word_Chains

    attr_reader :dictionary
    def initialize(dictionary_file_name)
        @dictionary = Set.new(File.readlines(dictionary_file_name).map(&:chomp))
        @all_seen_words = Hash.new{}
    end

    def adjacent_words(source)
        subset = @dictionary.select {|word| word if word.length == source.length}
        subset.select!{|word| word if adjacent?(source, word)}
        subset.delete(source)
        subset
    end

    def adjacent?(source, other_word)
        source.each_char.with_index do |char, index|
            sub_tar = source[0...index] + source[index+1..-1]
            sub_other = other_word[0...index] + other_word[index+1..-1]
            return true if sub_tar == sub_other
        end
        false
    end

    def explore_current_words(source_word)
        new_current_words = []
        adjacent_words(source_word).each do |word|
            next if @all_seen_words.has_key?(word)
            @all_seen_words[word] = source_word
            new_current_words << word
        end
        new_current_words
    end

    def build_path(target)
        path = [target]
        previous_step = @all_seen_words[target]
        while !previous_step.nil?
            path.unshift(previous_step)
            previous_step = @all_seen_words[previous_step]
        end
        if path.length > 1
            path.each {|word| print word + "\n"} 
        else
            p "no path found"
        end
    end

    def run(source, target)
        @current_words = []
        @current_words << source
        @all_seen_words[source] = nil
        done = false
        while !done
            done = true if @current_words.empty?
            break if @all_seen_words.has_key?(target)
            new_current_words = []
            @current_words.each do |current_word|
                new_current_words = explore_current_words(current_word)
            end
            @current_words = new_current_words
        end  
        # @all_seen_words.each do |key, val| 
        #     print key + " " + val.to_s
        #     print "\n"
        # end
        build_path(target)
    end
end

w = Word_Chains.new("dictionary.txt")
w.run("bye", "cat")

