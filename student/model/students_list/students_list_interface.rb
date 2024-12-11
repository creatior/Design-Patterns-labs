class Students_list_interface
  def get_student_by_id(id)
    raise NotImplementedError, "Not implemented"
  end

  def get_k_n_student_short_list(k, n, data_list = nil)
    raise NotImplementedError, "Not implemented"
  end

  def add_student(student)
    raise NotImplementedError, "Not implemented"
  end

  def replace_student(id, new_student)
    raise NotImplementedError, "Not implemented"
  end

  def delete_student(id)
    raise NotImplementedError, "Not implemented"
  end

  def get_student_short_count
    raise NotImplementedError, "Not implemented"
  end
end