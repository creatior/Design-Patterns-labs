class Person
	attr_reader :id, :git

	def has_git?
		!@git.nil?
	end

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
		if /^github\.com\/[a-zA-Z0-9_-]+$/.match?(git) || git.nil?
			true
		else 
			raise ArgumentError, "Неправильный ввод git: #{git}"
		end
	end
	
	# Установка ID
	def id=(id)
		if id && Person.id_valid?(id)
			@id = id
		end
	end
	
	# Установка git
	def git=(git)
		if git && Person.git_valid?(git)
			@git = git
		end
	end
end