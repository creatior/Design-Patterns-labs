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
		@phone_number = options[:phone_number]
		@telegram = options[:telegram]
		@email = options[:email]
		@git = options[:git]
	end
	
	# Объявление публичного метода, возвращающего строку, хранящую информацию о студенте
	public
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
end

