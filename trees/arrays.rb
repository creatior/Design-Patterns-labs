# Вывод индексов, отсортированных в проядке убывания соответсвующих им элементов
def sort_indeces_decrease(array)
	indices = (0...array.size).to_a
	indices.sort_by{|i| -array[i]}
end

# Вывод элементов между первым и вторым максимальным
def elements_between_first_and_second_maxs(array)
	max1, max2 = array.max(2)

	max1_index = array.index(max1)
	max2_index = array.index(max2)

	min_index = [max1_index, max2_index].min
	max_index = [max1_index, max2_index].max

	array[(min_index + 1)..(max_index - 1)]
end

# Вывод элементов между первым и последним максимальным
def elements_between_first_and_last_maxs(array)
	max_value = array.max

	first_max_index = array.index(max_value)
	last_max_index = array.rindex(max_value)

	array[(first_max_index + 1)..(last_max_index - 1)]
end

# Минимальный четный элемент
def min_even_element(array)
	array.select{ |element| element.even? }.min
end

# Простые делители числа
def prime_factors(n)
  factors = []
  (2..n).inject(n) do |current_n, i|
    while current_n % i == 0
		factors << i
		current_n /= i
	end
    current_n
  end
  factors
end

# Чтение массива из файла
def read_array_from_file()
  File.open("input_array.txt", 'r') do |file|
    content = file.read
    string_array = content.split
    integer_array = string_array.map(&:to_i)
    integer_array
  end
end

while (true)
	system "cls"
	puts("1. Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность.")
	puts("2. Дан целочисленный массив. Необходимо найти элементы, расположенные между первым и вторым максимальным.")
	puts("3. Дан целочисленный массив. Необходимо найти элементы, расположенные между первым и последним максимальным.")
	puts("4. Дан целочисленный массив. Необходимо найти минимальный четный элемент.")
	puts("5. Для введенного числа построить список всех его простых делителей, причем если введенное число делится на простое число p в степени α, то в итоговом списке число p должно повторятся α раз. Результирующий список должен быть упорядочен по возрастанию.")
	puts("0. Выход\n")
	
	print("Введите номер задачи:")
	
	choice = $stdin.gets.chomp
	case choice
	when '0'
		puts("Выход из программы.")
		break
	when '1'
		puts "Ответ: #{sort_indeces_decrease(read_array_from_file()).inspect}"
	when '2'
		puts "Ответ: #{elements_between_first_and_second_maxs(read_array_from_file()).inspect}"
	when '3'
		puts "Ответ: #{elements_between_first_and_last_maxs(read_array_from_file()).inspect}"
	when '4'
		puts "Ответ: #{min_even_element(read_array_from_file())}"
	when '5'
		print ("Введите число: ")
		number = $stdin.gets.chomp.to_i
		puts "Простые делители числа #{number}: #{prime_factors(number).inspect}"
	else
		puts("Неверный выбор. Пожалуйста, выберите снова.")
	end
	print "Продолжить? \[y\/n\] "
	if $stdin.gets.chomp == "n"
		break
	end
end