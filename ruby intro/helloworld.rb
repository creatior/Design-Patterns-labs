# Задание 1.1
# Вывод в консоль сообщения Hello, world!
puts ("Hello, world!")

# Задание 1.2
# Вывод в консоль приветствия с пользователем
puts ("Привет, #{ARGV[0]}!")

puts ("Какой твой любимый язык программирования?")

# Чтение ответа пользователя из консоли
lang = $stdin.gets.chomp

# Проверка ответа пользователя
if lang == "ruby"
	puts ("#{ARGV[0]}, вы - подлиза!")
elsif lang == "assembler"
	puts ("Оу... Ну ничего страшного, скоро будет Ruby!")
else
	puts("Это прекрасно, но скоро будет Ruby!")
end

# Задание 1.3
puts ("Введите команду Ruby, которую хотите выполнить:")
ruby_command = $stdin.gets.chomp
# Выполнение заданной команды Ruby
eval(ruby_command)

puts ("Введите системную команду, которую хотите выполнить:")
system_command = $stdin.gets.chomp
# Выполнение заданной системной команды
system(system_command)