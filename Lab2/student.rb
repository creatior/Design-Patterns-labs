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
	def to_s
		result = "ФИО: #{@name}"
		if @id != nil
			result += "; ID: #{@id}"
		end
		if @phone_number != nil
			result += "; Номер телефона: #{@phone_number}"
		end
		if @telegram != nil
			result += "; Telegram: #{@telegram}"
		end
		if @email != nil
			result += "; E-mail: #{@email}"
		end
		if @git != nil
			result += "; Git: #{@git}"
		end
		result
	end
end