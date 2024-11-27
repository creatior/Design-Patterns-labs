require_relative "./student.rb"
require_relative "./student_short.rb"
require_relative "./model/data_list_student_short.rb"
require_relative "./students_list_db.rb"
require_relative "./db_client.rb"
require "date"
require "pg"
require 'dotenv/load'

def print_table(table)
  (0...table.row_count).each do |i|
    (0...table.column_count).each do |j|
      print "#{table.get(i, j)}\t\t"
    end
    puts ""
  end
end

# data list test
def data_list_test
  student1 = Student.new(surname: "Васильев", first_name: "Иван", last_name: "Дмитриевич", id: 546, git: "github.com/vanyavvv", phone_number: "89365584621", telegram: "@vanyav", email: "vanyav@mail.ru", birthdate: Date.new(2002, 1, 23))
  student2 = Student.new(surname: "Кошкин", first_name: "Валерий", last_name: "Олегович", id: 154, email: "kvalera@bk.ru", git: "github.com/kvalera", birthdate: Date.new(2003, 1, 22))
  student3 = Student.new(surname: "Васильков", first_name: "Юрий", last_name: "Ахмедович", id: 675, phone_number: "84657558462", email: "yuvasilek@yandex.ru", birthdate: Date.new(2000, 7, 13))

  student1_short = Student_short.from_student(student:student1)
  student2_short = Student_short.from_student(student:student2)
  student3_short = Student_short.from_student(student:student3)
  list = [student1_short, student2_short, student3_short]

  data_list = Data_list_student_short.new(list)

  table = data_list.get_data

  print_table table
end

# database select test
def db_select_test
  conn = PG.connect(
    host: ENV['DB_HOST'],
    dbname: ENV['DB_NAME'],
    user: ENV['DB_USER'],
    password: ENV['DB_PASSWORD']
  )
  result = conn.exec("SELECT * FROM student WHERE birthdate > '2002-01-05'")
  result.each do |row|
    puts row
  end

  conn.close if conn
end

def student_constructor_from_hash_test
  hash = {
    "id": 546,
    "first_name": "Иван",
    "surname": "Васильев",
    "last_name": "Дмитриевич",
    "phone_number": "89365584621",
    "telegram": "@vanyav",
    "email": "vanyav@mail.ru",
    "git": "github.com/vanyavvv",
    "birthdate": "2002-01-23"
  }

  student = Student.new_from_hash(hash)
  puts student
end

def students_list_DB_test
  client = DB_client.instance(
    host: ENV['DB_HOST'],
    dbname: ENV['DB_NAME'],
    user: ENV['DB_USER'],
    password: ENV['DB_PASSWORD']
  )

  student_db = Students_list_DB.new(client)

  result1 = student_db.get_by_id(42)
  #puts result1

  result2 = student_db.get_k_n_student_short_list(1, 20)
  table = result2.get_data
  print_table table

  # result3 = student_db.add_student(Student.new(
  #   surname: "Васильев", 
  #   first_name: "Иван", 
  #   last_name: "Дмитриевич", 
  #   git: "github.com/vanyavvv", 
  #   phone_number: "89365584621", 
  #   telegram: "@vanyav", 
  #   email: "vanyav@mail.ru", 
  #   birthdate: Date.new(2002, 1, 23)))

  # result3 = student_db.replace_student_by_id(12, Student.new(
  #   surname: "Васильев", 
  #   first_name: "Иван", 
  #   last_name: "Дмитриевич", 
  #   git: "github.com/vanyavvv", 
  #   phone_number: "89365584621", 
  #   telegram: "@vanyav", 
  #   email: "vanyav@mail.ru", 
  #   birthdate: Date.new(2002, 1, 23)))

  # student_db.delete_by_id(48)

  puts student_db.get_student_short_count
end

students_list_DB_test