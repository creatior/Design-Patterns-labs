#super class
class Students_list

  def initialize(adapter)
    # students list interface
    self.adapter = adapter
  end

  # get student by id
  def get_student_by_id(id)
    self.adapter.get_student_by_id(id)
  end

  # get k list of n elements
  def get_k_n_student_short_list(k, n, data_list=nil, filter=nil)
    self.adapter.get_k_n_student_short_list(k, n, data_list, filter)
  end

  # add student
  def add_student(student)
    self.adapter.add_student(student)
  end

  # replace student by id
  def replace_student(id, new_student)
    self.adapter.replace_student(id, new_student)
  end

  # delete student by id
  def delete_student(id)
    self.adapter.delete_student(id)
  end

  # get count of students
  def get_student_short_count(filter=nil)
    self.adapter.get_student_short_count
  end

  private
  attr_accessor :adapter
end
