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
			

# Задание 1.4.1
print("Введите число: ")
number1 = $stdin.gets.chomp.to_i
puts ("Количество четных чисел, не взаимно простых с данным: #{countEvenNonCoprime(number1)}")

# Задание 1.4.2
print("Введите число: ")
number2 = $stdin.gets.chomp.to_i
print ("Наибольшая цифра числа, не делящаяся на 3: #{maxDigitNotDivByThree(number2)}")