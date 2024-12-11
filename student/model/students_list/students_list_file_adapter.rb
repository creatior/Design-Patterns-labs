require "./model/students_list/students_list_interface"

class Students_list_file_adapter < Students_list_interface

  def initialize(adapter)
    # students list file
    self.adapter = adapter
  end

  def get_student_by_id(id)
    self.adapter.get_student_by_id(id)
  end

  def get_k_n_student_short_list(k, n, data_list=nil, filter=nil)
    self.adapter.get_k_n_student_short_list(k, n, data_list, filter=nil)
  end

  def add_student(student)
    self.adapter.add_student(student)
  end

  def replace_student(id, new_student)
    self.adapter.replace_student(id, new_student)
  end

  def get_student_short_count
    self.adapter.get_student_short_count
  end

end