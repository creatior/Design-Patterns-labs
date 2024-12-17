require "yaml"
require "./model/students_list/data_storage/data_storage_strategy.rb"
require "./model/student/student.rb"

# class for working with yaml file
class YAML_storage_strategy < Data_storage_strategy
  # read from yaml
  def read(file_path)
    return [] unless File.exist?(file_path)
    data = YAML.safe_load(File.read(file_path), permitted_classes: [Date, Symbol]) || []
    data.map { |student| Student.new(**student) }
  end

  # write to yaml
  def write(file_path, students)
    data = students.map { |student| student.to_h }
    File.open(file_path, "w") do |file|
      file.write(data.to_yaml)
    end
  end
end