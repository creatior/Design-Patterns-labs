require_relative "./person.rb"
require_relative "./binary_tree/iterators/binary_iterator.rb"

# Класс, хранящий информацию о студенте
class Student < Person include Comparable
	# Объявление переменных экземпляра
	attr_reader :first_name, :surname, :last_name, :phone_number, :telegram, :email, :birthdate
	
	# Инициализация экзепляра класса
	def initialize first_name:, surname:, last_name:, id:nil, git:nil, phone_number:nil, telegram:nil, email:nil, birthdate:nil
	    if (!first_name || !surname || !last_name)
			raise ArgumentError, "ФИО не введен или введен не полностью"
		end
		
		self.first_name = first_name
	    self.surname = surname
	    self.last_name = last_name
		self.id = id
		self.git = git
		set_contacts(phone_number: phone_number, telegram: telegram, email: email)
		self.birthdate = birthdate
	end

	def <=>(other)
        if other.is_a?(Student)
            self.birthdate <=> other.birthdate

	# Установка контактов
	def set_contacts(contacts = [])
		if contacts[:phone_number] && Person.phone_number_valid?(contacts[:phone_number])
			@phone_number = contacts[:phone_number]
		end
		if contacts[:telegram] && Person.telegram_valid?(contacts[:telegram])
			@telegram = contacts[:telegram]
		end
		if contacts[:email] && Person.email_valid?(contacts[:email])
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
		result = initials
		if !@git.nil?
			result += "Git: #{@git}; "
		end
		result += contact
		return result
	end
	
	# Переопределение сеттеров с проверкой полей
	# Установка имени
	def first_name=(first_name)
		if first_name && Person.name_valid?(first_name)
			@first_name = first_name
		end
	end
		
	# Установка фамилии
	def surname=(surname)
		if surname && Person.name_valid?(surname)
			@surname = surname
		end
	end
	
	# Установка отчества
	def last_name=(last_name)
		if last_name && Person.name_valid?(last_name)
			@last_name = last_name
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

    # Установка даты рождения
	def birthdate=(birthdate)
		if birthdate && birthdate.class == "Date"
			@birthdate = birthdate
		end
	end
end