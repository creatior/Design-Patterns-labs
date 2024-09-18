class Student
	# Объявление переменных экземпляра
	attr_accessor :id, :phone_number, :telegram, :email, :git
	attr_reader :name
	
	# Инициализация экзепляра класса
	def initialize name, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil
	    @name = name
		@id = id
		@phone_number = phone_number
		@telegram = telegram
		@email = email
		@git = git
	end
	
	# Объявление публичного метода, печатающего информацию о студенте
	public
	def print_information
		print "ФИО: #{@name}"
		if @id != nil
			print "; ID: #{@id}"
		end
		if @phone_number != nil
			print "; Номер телефона: #{@phone_number}"
		end
		if @telegram != nil
			print "; Telegram: #{@telegram}"
		end
		if @email != nil
			print "; E-mail: #{@email}"
		end
		if @git != nil
			print "; Git: #{@git}"
		end
		print "\n"
	end
end