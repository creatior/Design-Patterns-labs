# Задание 1.4 (Вариант 4)

# Проверка двух чисел на взаимную простоту
def isCoprime (number1, number2)
	while number2 != 0
		number1, number2 = number2, number1 % number2
	end
	if number1 == 1
		true
	else
		false
	end
end

# Подсчет количества четных чисел, не взаимно простых с данным
def countEvenNonCoprime (number)
	count = 0
	(2..number).each do |x|
		if !isCoprime(number, x) && x.even?
			count += 1
		end
	end
	count
end

# Поиск максимальной цифры числа, не делящейся на 3
def maxDigitNotDivByThree (number)
	max_digit = 0
	while number > 0
		if (number % 10) % 3 != 0 && number % 10 > max_digit
			max_digit = number % 10
		end
		number /= 10
	end
	max_digit
end

# Поиск минимального делителя числа
def minDivider(number)
	(2..number).each do |x|
		if number % x == 0
			return x
		end
	end
	number
end
	
	
# Поиск максимального числа, не взаимно простого с данным и не делящегося на его наименьший делитель
def maxNonCoprime(number)
	min_div = minDivider(number)
	(number - 1).downto(2) do |x|
		if !isCoprime(number, x) && x % min_div != 0
			return x
		end
	end
	0
end

# Вычисление суммы цифр числа, меньших 5
def sumDigitsLessFive (number)
	temp = number
	sum = 0
	while temp > 0
		if temp % 10 < 5
			sum += temp % 10
		end
		temp /= 10
	end
	sum
end
	
# Умножение максимального не взаимно простого на сумму цифр
def multiply (number)
	maxNonCoprime(number) * sumDigitsLessFive(number)
end

# Задание 1.4.1
print("Введите число: ")
number1 = $stdin.gets.chomp.to_i
puts ("Количество четных чисел, не взаимно простых с данным: #{countEvenNonCoprime(number1)}")

# Задание 1.4.2
print("Введите число: ")
number2 = $stdin.gets.chomp.to_i
puts ("Наибольшая цифра числа, не делящаяся на 3: #{maxDigitNotDivByThree(number2)}")

# Задание 1.4.3
print("Введите число: ")
number3 = $stdin.gets.chomp.to_i
puts ("Произведение максимального числа, не взаимно простого с данным, не делящегося на наименьший делитель исходно числа, и суммы цифр числа, меньших 5: #{multiply(number3)}")