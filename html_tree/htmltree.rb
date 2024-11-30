require "./tag.rb"
require "./iterators/dfs_iterator.rb"
require "./iterators/bfs_iterator.rb"

class HTMLTree
	include Enumerable
	attr_accessor :root
	
	ALLOWED_TAGS = %w[html head title body header nav main footer div p h1 h2 a span].freeze
	ALLOWED_ATTRIBUTES = %w[href src id onclick class].freeze
	
	def initialize
		@root = parse_html("./index.html")
	end
	
	def bfs
		BFS_Iterator.new(self.root)
	end

	def dfs
		DFS_Iterator.new(self.root)
	end

	private

	def parse_html(file_name)
		html_string = ""
		File.open(file_name, 'r') do |file|
    		html_string = file.read
  		end

  		tags = html_string.gsub(/\s+/, ' ').scan(/<\/?[^>]+>/)

  		current_node = nil
		stack = []

  		tags.each do |tag|
  			if tag =~ /<\/(\w+)>/
  				stack.pop
  				current_node = stack.last
  			elsif tag =~ /<(\w+)([^>]*)>/
  				tag_name, attrs_name = $1, $2
		
				attributes = parse_attributes(attrs_name)
				
				tag = Tag.new(tag_name, attributes)
				
				if current_node
					current_node.add_child(tag)
				else
					@root = tag
				end
				stack.push(tag)
				current_node = tag
			end
  		end
		@root
	end
	
	def parse_attributes(attributes_string)
		attributes = {}
		attributes_string.scan(/(\w+)="([^"]+)"/).each do |key, value|
			attributes[key] = value if ALLOWED_ATTRIBUTES.include?(key)
		end
		attributes
	end
	
	

end