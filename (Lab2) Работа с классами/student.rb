require "./validator.rb"

# Класс, хранящий информацию о студенте
class Student
	# Объявление переменных экземпляра
	attr_reader :first_name, :surname, :last_name, :id, :phone_number, :telegram, :email, :git
	
	# Инициализация экзепляра класса
	def initialize first_name:, surname:, last_name:, id:nil, git:nil, phone_number:nil, telegram:nil, email:nil
	    if (!first_name || !surname || !last_name)
			raise ArgumentError, "ФИО не введен или введен не полностью"
		end
		
		self.first_name = first_name
	    self.surname = surname
	    self.last_name = last_name
		self.id = id
		self.git = git
		set_contacts(phone_number: phone_number, telegram: telegram, email: email)
	end
	
	# Установка контактов
	def set_contacts(contacts = [])
		if contacts[:phone_number] && Validator.phone_number_valid?(contacts[:phone_number])
			@phone_number = contacts[:phone_number]
		end
		if contacts[:telegram] && Validator.telegram_valid?(contacts[:telegram])
			@telegram = contacts[:telegram]
		end
		if contacts[:email] && Validator.email_valid?(contacts[:email])
			@email = contacts[:email]
		end
	end
	
	public

	# Объявление публичного метода, возвращающего строку, хранящую информацию о студенте
	
	def to_s
		result = "ФИО: #{@surname} #{@first_name} #{@last_name}"
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

	def get_info
		result = "#{@surname} #{@first_name[0]}. #{@last_name[0]}.; "
		if !@git.nil?
			result += "Git: #{@git}; "
		end
		if !@phone_number.nil?
			result += "Номер телефона: #{@phone_number}"
		elsif !@telegram.nil?
			result += "Telegram: #{@telegram}"
		elsif !@email.nil?
			result += "E-mail: #{@email}"
		end
		result
	end
	
	def get_contact
		if !@phone_number.nil?
			"Номер телефона: #{@phone_number}"
		elsif !@telegram.nil?
			"Telegram: #{@telegram}"
		elsif !@email.nil?
			"Email: #{@email}"
		end
	end
	
	def validate
		has_git? && has_contacts?
	end
		
	def has_git?
		!@git.nil?
	end
	
	def has_contacts?
		!@phone_number.nil? || !@email.nil? || !@telegram.nil?
	end
	
	# Переопределение сеттеров с проверкой полей
	# Установка имени
	def first_name=(first_name)
		if first_name && Validator.name_valid?(first_name)
			@first_name = first_name
		end
	end
		
	# Установка фамилии
	def surname=(surname)
		if surname && Validator.name_valid?(surname)
			@surname = surname
		end
	end
	
	# Установка отчества
	def last_name=(last_name)
		if last_name && Validator.name_valid?(last_name)
			@last_name = last_name
		end
	end

	# Установка ID
	def id=(id)
		if id && Validator.id_valid?(id)
			@id = id
		end
	end
	
	# Установка git
	def git=(git)
		if git && Validator.git_valid?(git)
			@git = git
		end
	end
end