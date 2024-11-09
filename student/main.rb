# Загрузка класса из файла в текущей директории
require "./student.rb"
require "./student_short.rb"

# Создание экземляров класса и вывод информации на экран
student1 = Student.new(surname: "Васильев", first_name: "Иван", last_name: "Дмитриевич", id: 546, git: "github.com/vanyavvv", phone_number: "89365584621", telegram: "@vanyav", email: "vanyav@mail.ru")

puts student1

student1_short1 = Student_short.from_student(student: student1)
student1_short2 = Student_short.from_string(id: student1.id, student_info: student1.get_info)

puts student1_short1
puts student1_short2

puts student1_short1
#student2 = Student.new(surname: "Кошкин", first_name: "Валерий", last_name: "Олегович", id: 154, email: "kvalera@bk.ru", git: "github.com/kvalera")

#puts student2

#student3 = Student.new(surname: "Васильков", first_name: "Юрий", last_name: "Ахмедович", id: 675, phone_number: "84657558462", email: "yuvasilek@yandex.ru")

#puts student3