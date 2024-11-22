class Tag
	attr_reader :name, :attributes, :children
	
	def initialize(name, attributes = {})
		@name = name
		@attributes = attributes
		@children = []
	end
	
	def attributes_to_s
		@attributes.inject("") do |result, (key, value)|
			result << " #{key}=\"#{value}\""
		end
	end
	
	def to_s
		result = "<#{@name}" 
		if attributes_to_s != ""
			result += "#{attributes_to_s}"
		end
		result += "></#{@name}>"
		result
	end
	
	def add_child(child)
		@children << child
	end
	
end