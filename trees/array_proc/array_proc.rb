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
	
	# Возвращает объект класса Enumerator, состоящий из пар элементов: результат работы блока и массив значений, соответствующих этому результату
	def chunk(&block)
		Enumerator.new do |y|
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
			collections.each do |group|
			y << group
			end
		end
	end
	
	# Возвращает true, если элемент с заданным условием входит в коллекцию, false - в обратном случае
	def include?(&block)
		@array.each do |element|
			if yield element
				return true
			end
		end
		return false
	end
	
	# Возвращает объект (аккумулятор)
	def reduce(init = nil, &block)
		accumulator = init
		if accumulator.nil?
			accumulator = 0
		end
		@array.each do |element|
			accumulator = yield accumulator, element
		end
		return accumulator			
	end
	
	# Возвращает объект, представляющий сумму элементов коллекции, соответствующих условию блока
	def sum(&block)
		sum = 0
		@array.each do |element|
			if yield element
				sum += element
			end
		end
		return sum
	end
	
	# Возвращает true, если элемент с заданным условием входит в коллекцию, false - в обратном случае
	def member?(&block)
		@array.each do |element|
			if yield element
				return true
			end
		end
		return false
	end
	
	# Возвращает коллекцию, элементы которой соответствуют условию блока
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