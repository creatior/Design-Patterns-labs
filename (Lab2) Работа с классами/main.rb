# Загрузка класса из файла в текущей директории
require "./student.rb"

# Создание экземляров класса и вывод информации на экран
student1 = Student.new("Васильев", "Иван", "Дмитриевич", id: 546, phone_number: "89365584621", telegram: "@vanyav", email: "vanyav@mail.ru", git: "github.com/vanyavvv")

puts student1.get_info()

student2 = Student.new("Кошкин", "Валерий", "Олегович", id: 154, email: "kvalera@bk.ru", git: "github.com/kvalera")

puts student2

student3 = Student.new("Васильков", "Юрий", "Ахмедович", id: 675, phone_number: "84657558462", email: "yuvasilek@yandex.ru")

puts student3