# Нахождение минимального элемента в массиве
def minElement (array)
	min = 100000
	for x in array
		if x < min
			min = x
		end
	end
	min
end

# Нахождение номера первого положительного элемента массива
def firstPositiveElement (array)
	i = 0
	while i < array.size
		if array[i] > 0
			return i + 1
		end
		i += 1
	end
	-1
end

# Извлечение массива из файла и выполнение выбранного метода
def chooseMethod (method, array_path)
	# Чтение массива из файла
	array_src = File.new(array_path)
	array = array_src.readlines.map(&:chomp).map(&:to_i)
	
	# Выполнение выбранного метода
	result = 0
	if method == 1
		result = minElement(array)
	elsif method == 2
		result = firstPositiveElement(array)
	end
	result
end

puts "Выбран метод #{ARGV[0]}"

if ARGV[0] == 1
	print "Минимальный элемент в массиве: "
elsif
	print "Номер первого положительного элемента массива: "
end
puts "Результат: #{chooseMethod(ARGV[0].to_i, ARGV[1])}"