# Задание 1.4 (Вариант 4)

# Проверка двух чисел на взаимную простоту
def isCoprime (a, b)
	while b != 0
		a, b = b, a % b
	end
	if a == 1
		true
	else
		false
	end
end

# Подсчет количества четных чисел, не взаимно простых с данным
def countEvenNonCoprime (a)
	n = 0
	(2..a).each do |x|
		if !isCoprime(a, x) && x.even?
			n += 1
		end
	end
	n
end

# Задание 1.4.1
print("Введите число: ")
a = $stdin.gets.chomp.to_i
print ("Количество четных чисел, не взаимно простых с данным: #{countEvenNonCoprime(a)}")