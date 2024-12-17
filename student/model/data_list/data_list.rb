require "./model/data_table/data_table.rb"

class Data_list
	attr_accessor :list, :observers, :count, :index
	def initialize(list)
		self.list = list
		self.selected = []
		self.index = 1
		self.observers = []
		self.count = 0
	end

	def select(number)
		if number > list.length
			raise IndexError, "Index out of range"
		else 
			self.selected << number
		end
	end

	def get_selected
		self.selected
	end

	def get_names
		raise NotImplementedError, "Not implemented"
	end

	def get_data
		result = []
		self.list.each do |element|
			data = element
			new_row = build_row(self.index, element)
			result << new_row
			self.index += 1
		end
		result = [get_names].concat(result)
		return Data_table.new(result)
	end

	def notify
		return if self.observers.length == 0
			self.observers.each do |observer|
				observer.set_table_params(self.get_names, self.count)
				observer.set_table_data(self.get_data)
			end
	end

	def add_observer(observer)
		self.observers << observer
	end

	def list=(list)
		unless list.is_a?(Array)
			raise ArgumentError, "Data must be an instance or array"
		end
		@list = list
	end

	private
	attr_accessor :selected

	def build_row(index, object)
		raise NotImplementedError, "Not implemented"
	end
end