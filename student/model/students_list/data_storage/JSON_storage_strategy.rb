require "json"
require "./model/data_storage/data_storage_strategy"
require "./model/student/student.rb"

# class for working with json file
class JSON_storage_strategy < Data_storage_strategy
  # read from json
  def read(file_path)
    return [] unless File.exist?(file_path)
    JSON.parse(File.read(file_path), symbolize_names: true).map do |data|
        Student.new(**data)
    end
  end

  # write to json
  def write(file_path, students)
    data = students.map { |student| student.to_h }
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end 
end