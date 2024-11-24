require_relative "./student.rb"
require_relative "./student_short.rb"
require_relative "./model/data_list_student_short.rb"
require "date"
def print_table(table)
  (0...table.row_count).each do |i|
    (0...table.column_count).each do |j|
      print "#{table.get(i, j)} "
    end
    puts ""
  end
end

def data_list_test
  student1 = Student.new(surname: "Васильев", first_name: "Иван", last_name: "Дмитриевич", id: 546, git: "github.com/vanyavvv", phone_number: "89365584621", telegram: "@vanyav", email: "vanyav@mail.ru", birthdate: Date.new(2002, 1, 23))
  student2 = Student.new(surname: "Кошкин", first_name: "Валерий", last_name: "Олегович", id: 154, email: "kvalera@bk.ru", git: "github.com/kvalera", birthdate: Date.new(2003, 1, 22))
  student3 = Student.new(surname: "Васильков", first_name: "Юрий", last_name: "Ахмедович", id: 675, phone_number: "84657558462", email: "yuvasilek@yandex.ru", birthdate: Date.new(2000, 7, 13))

  student1_short = Student_short.from_student(student:student1)
  student2_short = Student_short.from_student(student:student2)
  student3_short = Student_short.from_student(student:student3)
  list = [student1_short, student2_short, student3_short]

  data_list = Data_list_student_short.new(list)
  data_list.select(0)
  data_list.select(1)

  table = data_list.get_data

  print_table table
end

data_list_test