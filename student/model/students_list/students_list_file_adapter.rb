require "./model/students_list/students_list_interface"

class Students_list_file_adapter < Students_list_interface
  attr_accessor :adaptee
  def initialize(adaptee)
    # students list file
    self.adaptee = adaptee
  end

  def get_student_by_id(id)
    self.adaptee.get_student_by_id(id)
  end

  def get_k_n_student_short_list(k, n, data_list=nil, filter=nil)
    self.adaptee.get_k_n_student_short_list(k, n, data_list, filter=nil)
  end

  def add_student(student)
    self.adaptee.add_student(student)
  end

  def replace_student(id, new_student)
    self.adaptee.replace_student(id, new_student)
  end

  def get_student_short_count
    self.adaptee.get_student_short_count
  end

end