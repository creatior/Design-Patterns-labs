require "./model/students_list/students_list.rb"
require "./model/students_list/students_list_file.rb"
require "./model/students_list/students_list_file_adapter.rb"
require "./model/students_list/data_storage/JSON_storage_strategy.rb"

def print_table(table)
  (0...table.row_count).each do |i|
    (0...table.column_count).each do |j|
      print "#{table.get(i, j)}\t\t"
    end
    puts ""
  end
end

list = Students_list.new(Students_list_file_adapter.new(Students_list_file.new("./students.json", JSON_storage_strategy.new)))

table = list.get_k_n_student_short_list(1, 10).get_data
print_table table