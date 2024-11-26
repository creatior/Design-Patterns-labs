require "yaml"
require_relative "students_list.rb"

# class for working with yaml file
class Students_list_YAML < Students_list
  # read from yaml
  def read
    return [] unless File.exist?(self.file_path)
    data = YAML.safe_load(File.read(self.file_path), permitted_classes: [Date, Symbol]) || []
    data.map { |student| Student.new(**student) }
  end

  # write to yaml
  def write
    data = self.students.map { |student| student.to_h }
    File.open(self.file_path, "w") do |file|
      file.write(data.to_yaml)
    end
  end
end