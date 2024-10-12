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
		@git = options[:git]
		set_contacts(phone_number:options[:phone_number], telegram:options[:telegram], email:options[:email])
	end
	
	# Установка контактов
	def set_contacts(contacts = [])
		if contacts[:phone_number] && Student.phone_number_valid?(contacts[:phone_number])
			@phone_number = contacts[:phone_number]
		end
		if contacts[:telegram] && Student.telegram_valid?(contacts[:telegram])
			@telegram = contacts[:telegram]
		end
		if contacts[:email] && Student.email_valid?(contacts[:email])
			@email = contacts[:email]
		end
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

	def get_info
		result = "#{@surname} #{@first_name} #{last_name}, "
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
		
	def validate
		has_git? && has_contacts?
	end
		
	def has_git?
		!@git.nil?
	end
	
	def has_contacts?
		!@phone_number.nil? || !@email.nil? || !@telegram.nil?
	end
	
	# Методы проверки валидности введенных полей
	# Проверка номера телефона
	def self.phone_number_valid?(phone_number)
		if /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/.match?(phone_number) || phone_number.nil?
			true
		else
			raise ArgumentError, "Неправильная запись номера телефона: #{phone_number}"
		end
	end
	
	# Проверка имени, фамилии и отчества
	def self.name_valid?(name)
		if /^[A-ZА-Я][a-zA-Zа-яА-Я\-]{0,49}$/.match?(name)
			true
		else 
			raise ArgumentError, "Неправильная запись ФИО: #{name}"
		end
	end
	
	# Проверка ID
	def self.id_valid?(id)
		if id.nil? || id.class == Integer
			true
		else 
			raise ArgumentError, "Неправильный ввод ID: #{id}"
		end
	end
	
	# Проверка telegram
	def self.telegram_valid?(telegram)
		if /^@[a-zA-Z0-9_]{4,20}$/.match?(telegram) || telegram.nil?
			true
		else 
			raise ArgumentError, "Неправильный ввод telegram: #{telegram}"
		end
	end	
	
	# Проверка email
	def self.email_valid?(email)
		if /^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/.match?(email) || email.nil?
			true
		else 
			raise ArgumentError, "Неправильный ввод email: #{email}"
		end
	end
	
	# Проверка git
	def self.git_valid?(git)
		if /^(?:https:\/\/github\.com\/)?[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/.match?(git) || git.nil?
			true
		else 
			raise ArgumentError, "Неправильный ввод git: #{git}"
		end
	end
	
	# Переопределение сеттеров с проверкой полей
	# Установка имени
	def first_name=(first_name)
		if first_name && Student.name_valid?(first_name)
			@first_name = first_name
		end
	end
		
	# Установка фамилии
	def surname=(surname)
		if surname && Student.name_valid?(surname)
			@surname = surname
		end
	end
	
	# Установка отчества
	def last_name=(last_name)
		if last_name && Student.name_valid?(last_name)
			@last_name = last_name
		end
	end
	
	# Установка ID
	def id=(id)
		if id && Student.id_valid?(id)
			@id = id
		end
	end
	
	# Установка git
	def git=(git)
		if git && Student.git_valid?(id)
			@git = git
		end
	end
end

