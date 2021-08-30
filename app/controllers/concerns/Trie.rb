class TrieNode
  attr_accessor :children, :end_node
  def initialize(children = {})
    @children = children
    @value = ""
    @end_node = false
  end

  def containsLetter?(char)
    !children[char].nil?
  end

  def get(char)
    children[char]
  end

  def insert(char)
    children[char] = TrieNode.new
  end

  def set_end
    @end_node = true
  end

  def set_value(word)
    @value = word
  end

  def get_value
    @value
  end

  def is_end?
    end_node
  end
end

# ----------- Trie --------------
class Trie
  include Singleton

  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = root
    word.chars.each { |char|
      node = node.get(char) || node.insert(char)
    }
    node.set_end
    node.set_value(word)
    node
  end

  def search(word)
    found_keyword = Set.new
    node = root
    word.chars.each { |char|
      # puts "Search", char
      break unless node.get(char)
      node = node.get(char)
      if node.is_end?
        # puts "Found!", char
        found_keyword.add(node.get_value)
      end
    }
    found_keyword
  end
end
