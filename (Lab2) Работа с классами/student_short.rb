# Класс, хранящий краткую информацию о студенте
class Student_short
	attr_reader :id, :initials, :git, :contact
	
	def initialize (student:nil, id:nil, student_info:nil)
		if !student.nil?
			@id = student.id
			@initials = "#{student.surname} #{student.first_name[0]}. #{student.last_name[0]}."
			@git = "Git: #{student.git}"
			@contact = student.get_contact
		elsif !id.nil? && !student_info.nil?
			@id = id
			args = student_info.split("; ")
			@initials = args[0]
			@git = args[1]
			@contact = args[2]
		end
	end
	
	def to_s
		"ID: #{id}; #{initials}; #{git}; #{contact}"
	end
end