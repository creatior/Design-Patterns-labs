class Student
	# Объявление переменных экземпляра
	attr_accessor :id, :phone_number, :telegram, :email, :git
	attr_reader :first_name, :surname, :last_name 
	
	# Инициализация экзепляра класса
	def initialize first_name, surname, last_name , options = []
	    @first_name = first_name
	    @surname = surname
	    @last_name = last_name
		@id = options[:id]
		
		# Проверка валидности ввода номера телефона
		Student.phone_number_valid?(options[:phone_number])
		@phone_number = options[:phone_number]
		
		@telegram = options[:telegram]
		@email = options[:email]
		@git = options[:git]
	end
	
	public

	# Объявление публичного метода, возвращающего строку, хранящую информацию о студенте
	
	def to_s
		result = "ФИО: #{@first_name} #{@surname} #{@last_name}"
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
	
	# Метод проверки валидности номера телефона
	def self.phone_number_valid?(phone_number)
		if /\A\d{11}\z/.match?(phone_number) || phone_number == nil
			true
		else
			raise ArgumentError, "Неправильная запись номера телефона: #{phone_number}"
		end
	end
	
	# Переопределение сеттера для phone_number с проверкой
	def phone_number=(phone_number)
		if phone_number && Student.phone_number_valid?(phone_number)
			@phone_number = phone_number
		end
	end
end

