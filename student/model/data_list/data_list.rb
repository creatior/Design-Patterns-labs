require "./model/data_table/data_table.rb"

class Data_list
	attr_reader :list
	def initialize(list)
		self.list = list
		self.selected = []
		self.index = 1
	end

	def select(number)
		if number > list.length
			raise IndexError, "Index out of range"
		else 
			self.selected << number
		end
	end

	def get_selected
		ids = []
		selected.each do |index|
			ids << self.selected[index].id
		end
		ids
	end

	def get_names
		raise NotImplementedError, "Not implemented"
	end

	def get_data
		result = []
		self.list.each do |element|
			data = element
			new_row = build_row(index, element)
			result << new_row
			self.index += 1
		end
		result = [get_names].concat(result)
		return Data_table.new(result)
	end

	private
	#attr_reader :list
	attr_accessor :selected, :index

	def list=(list)
		unless list.is_a?(Array)
			raise ArgumentError, "Data must be an instance or array"
		end
		@list = list
	end

	def build_row(index, object)
		raise NotImplementedError, "Not implemented"
	end
end