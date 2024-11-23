require_relative "./iterator.rb"

class DFS_Iterator < Iterator
	def enumerator
		Enumerator.new do |yielder|
			enum_stack = [self.root]
			until enum_stack.empty?
				element = enum_stack.pop
				yielder << element
				enum_stack.concat element.children.reverse if element.children
			end
		end
	end
end