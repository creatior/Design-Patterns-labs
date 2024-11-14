# 4, 16, 28, 33, 21, 9

# chunk
# include?
# reduce
# sum
# member?
# filter

# Класс обработки массива
class Array_proc
	attr_reader :array
	
	def initialize(array = [])
		@array = array
	end
	
	def to_s
		@array.inspect
	end
	
	def chunk(&block)
		collections = []
		current_group = []
		previous_value = nil
		@array.each do |element|
			current_value = yield element
			
			if previous_value.nil? || previous_value != current_value
				collections << [current_value, []]
				current_group = collections.last.last
			end
			
			current_group << element
			previous_value = current_value
		end
		return collections
	end
	
	def include?(&block)
		@array.each do |element|
			if yield element
				return true
			end
		end
		return false
	end
	
	def reduce(&block)
		accumulator = init
		@array.each do |element|
			accumulator = yield accumulator, element
		end
		return accumulator			
	end
	
	def sum(&block)
		sum = init
		@array.each do |element|
			if yield element
				sum += element
			end
		end
		return sum
	end
	
	def member?(&block)
		@array.each do |element|
			if yield element
				return true
			end
		end
		return false
	end
	
	def filter(&block)
		collection = []
		@array.each do |element|
			if yield element
				collection << element
			end
		end
		return collection
	end
end