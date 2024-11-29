require "./model/data_table/data_table.rb"
require "./model/data_list/data_list.rb"

class Data_list_student_short < Data_list

	def get_names
		["№", "Initials", "Git", "Contact"]
	end

	def build_row(index, obj)
		[index, obj.initials, obj.git, obj.contact]
	end
end