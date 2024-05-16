# Louis Romeo
# CSC 372
# PA5 Question 6

class TrieNode
  attr_accessor :children, :is_end_of_word

  def initialize
    @children = {}
    @is_end_of_word = false
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char do |char|
      node.children[char] ||= TrieNode.new
      node = node.children[char]
    end
    node.is_end_of_word = true
  end

  def search(word)
    node = search_prefix(word)
    return false unless node

    if node.is_end_of_word
      puts "Found: #{word}"
    else
      puts "Prefix found: #{word}"
      print_all_words(node, word)
    end
  end

  private

  def search_prefix(prefix)
    node = @root
    prefix.each_char do |char|
      return nil unless node.children[char]
      node = node.children[char]
    end
    node
  end

  def print_all_words(node, prefix)
    if node.is_end_of_word
      puts "  - #{prefix}"
    end

    node.children.each_key do |char|
      print_all_words(node.children[char], prefix + char)
    end
  end
end

def build_trie_from_file(file_name)
  trie = Trie.new
  File.foreach(file_name).with_index do |line, line_num|
    words = line.split
    words.each_with_index do |word, word_num|
      cleaned_word = word.gsub(/\W/, '') # Remove non-word characters (punctuation)
      trie.insert(cleaned_word.downcase) unless cleaned_word.empty?
    end
  end
  trie
end

puts "Type the name of your file:"
file_name = gets.chomp

# Build trie from file
trie = build_trie_from_file(file_name)

# Interactive search
puts "Type a string to search for (type ':q' to quit):"
loop do
  input = gets.chomp
  break if input == ":q"

  trie.search(input.downcase)
end