# data storage strategy interface
class Data_storage_strategy
  
  def read(file_path)
    raise NotImplementedError, "Not implemented"
  end

  def write(file_path, students)
    raise NotImplementedError, "Not implemented"
  end

end