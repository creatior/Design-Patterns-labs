require "./model/student/person.rb"

# Класс, хранящий краткую информацию о студенте
class Student_short < Person
	# to string
	def to_s
		"ФИО: #{@initials}; ID: #{@id}; Git: #{@git}; #{@contact}"
	end

	def self.from_student (student:nil)
		new(id:student.id, git: "#{student.git}", initials: student.get_info.split("; ")[0], contact: student.contact)
	end

	def self.from_string (id=nil, student_info=nil)
		initials, git, contact = student_info.split("; ")
		new(id:id, git:git, initials:initials, contact:contact)
	end

	private

	def initialize (id: nil, git: nil, initials:nil, contact:nil)
		@id = id
		@git = git
		@initials = initials
		@contact = contact
	end
end	