
class Data_table
	def initialize(data)
		self.data = data
	end

	def row_count
		self.data.length
	end

	def column_count
		return self.data.first.length if !self.data.first.nil?
		0
	end

	def get(row, column)
		if row > row_count
			raise IndexError, "Row index is out of range"
		elsif column > column_count
			raise IndexError, "Column index is out of range"
		else
			return self.data[row][column]
		end
	end

	private
	attr_reader :data

	def data=(data)
		unless data.is_a?(Array) && data.all? {|row| row.is_a?(Array)}
			raise ArgumentError, "Data must be two-dimesional array"
		end
		@data = data
	end

end