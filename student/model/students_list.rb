# super class
class Students_list
  # constructor
  def initialize(file_path)
    self.file_path = file_path
    self.students = read
  end

  # reading from file
  def read
    raise NotImplementedError, "Not implemented"
  end

  # writing to file
  def write
    raise NotImplementedError, "Not implemented"
  end

  # get student by id
  def get_student_by_id(id)
    self.students.find {|student| student.id == id}
  end

  # get k list of n elements
  def get_k_n_student_short_list(k, n, data_list=nil)
    start_index = (k - 1) * n
    students_short = (self.students[start_index, n] || []).map { |student| Student_short.from_student(student) }
    data_list ||= Data_list_student_short.new(students_short)
    data_list
  end

  # sort by initials
  def sort_by_initials
    self.students.sort_by! {|student| student.initials}
  end

  # add student
  def add_student(student)
    max_id = self.students.map(&:id).max || 0
    student.id = max_id + 1
    self.students << student
  end

  # replace student by id
  def replace_student(id, new_student)
    index = self.students.find_index { |student| student.id == id }
    raise IndexError, 'Unknown student ID' unless index
    new_student.id = id
    self.students[index] = new_student
  end

  # delete student by id
  def delete_student(id)
    self.students.reject! { |student| student.id == id }
  end

  # get count of students
  def get_student_short_count
    self.students.size
  end

  private
  attr_accessor :students, :file_path
end