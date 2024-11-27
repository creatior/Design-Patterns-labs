require_relative "./model/data_list_student_short.rb"
require_relative "./student.rb"
require_relative "./db_client.rb"

class Students_list_DB
  # constructor
  def initialize(connection)
    self.connection = connection
  end

  # get student by id
  def get_by_id(id)
    result = self.connection.query("SELECT * FROM student WHERE id = #{id}")
    result = result.first

    return nil unless result
    student = Student.new_from_hash(result)
  end

  # get k n student_short list
  def get_k_n_student_short_list(k, n)
    start_index = (k - 1) * n
    result = self.connection.query("SELECT * FROM student LIMIT #{n} OFFSET #{start_index}").to_a
    students_short = (result || []).map { |hash| Student_short.from_student(student:Student.new_from_hash(hash)) }
    data_list ||= Data_list_student_short.new(students_short)
    data_list
  end

  # add student
  def add_student(student)
    surname = student.surname
    first_name = student.first_name
    last_name = student.last_name
    telegram = student.telegram
    email = student.email
    phone_number = student.phone_number
    git = student.git
    birthdate = student.birthdate

    query = <<-SQL
      INSERT INTO student (surname, first_name, last_name, telegram, email, phone_number, git, birthdate)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    SQL
    self.connection.query(query, [surname, first_name, last_name, telegram, email, phone_number, git, birthdate])
  end

  # replace student by id
  def replace_student_by_id(id, student)
    surname = student.surname
    first_name = student.first_name
    last_name = student.last_name
    telegram = student.telegram
    email = student.email
    phone_number = student.phone_number
    git = student.git
    birthdate = student.birthdate

    query = <<-SQL
      UPDATE student
      SET surname = $1, first_name = $2, last_name = $3, telegram = $4, email = $5, phone_number = $6, git = $7, birthdate = $8
      WHERE id = $9
    SQL
    self.connection.query(query, [surname, first_name, last_name, telegram, email, phone_number, git, birthdate, id])
  end

  # delete by id
  def delete_by_id(id)
    self.connection.query("DELETE FROM student WHERE id = #{id}")
  end

  # get count of student_short
  def get_student_short_count
    result = self.connection.query("SELECT COUNT(*) FROM student")
    result.first["count"].to_i
  end

  private
  attr_accessor :connection
end