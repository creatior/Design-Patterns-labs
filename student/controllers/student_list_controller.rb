require "./views/student_list_view.rb"
require "./model/students_list/data_storage/JSON_storage_strategy.rb"
require "./model/students_list/students_list_file.rb"
require "./model/students_list/students_list_file_adapter.rb"
require "./model/students_list/students_list.rb"
require "./model/data_list/data_list.rb"
require "./model/data_list/data_list_student_short.rb"

class Student_list_controller

  def initialize(view)
    self.view = view
    begin
      self.students_list = Students_list.new(Students_list_file_adapter.new(Students_list_file.new("./students.json", JSON_storage_strategy.new)))
      self.data_list = Data_list_student_short.new([])
      self.data_list.add_observer(self.view)
    rescue StandardError => e
      self.view.show_error_message("Ошибка при доступе к данным: #{e.message}")
    end
  end

  def refresh_data
    self.students_list.get_k_n_student_short_list(self.view.current_page, self.view.items_per_page - 1, self.data_list)
    self.data_list.count = self.students_list.get_student_short_count
    self.data_list.notify
  end

  private
  attr_accessor :view, :students_list, :data_list


end