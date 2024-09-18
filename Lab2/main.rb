# Загрузка класса из файла в текущей директории
require_relative "Student"

# Создание экземляров класса и вывод информации на экран
student1 = Student.new("Васильев Иван Дмитриевич")
student1.id = 546
student1.phone_number = "89365584621"
student1.telegram = "@vanyav"
student1.email = "vanyav@mail.ru"
student1.git = "github.com/vanyavvv"

student1.print_information

student2 = Student.new("Кошкин Валерий Олегович")
student2.id = 154
student2.email = "kvalera@bk.ru"
student2.git = "github.com/kvalera"

student2.print_information

student3 = Student.new("Васильков Юрий Ахмедович")
student3.id = 675
student3.phone_number = "84657558462"
student3.email = "yuvasilek@yandex.ru"

student3.print_information