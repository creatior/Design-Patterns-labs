class Student
	attr_reader :name
	# Инициализация экзепляра класса
	def initialize name, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil
	    @name = name
		@phone_number = phone_number
		@telegram = telegram
		@email = email
		@git = git
	end
	# Геттеры и сеттеры
	def id=(id)
		@id = id
	end
	
	def id
		@id
	end
	
	def phone_number=(phone_number)
		@phone_number = phone_number
	end
	
	def phone_number
		@phone_number
	end
	
	def telegram=(telegram)
		@telegram = telegram
	end
	
	def telegram
		@telegram
	end

	def email=(email)
		@email = email
	end
	
	def email
		@email
	end
	
	def git=(git)
		@git = git
	end
	
	def git
		@git
	end
end