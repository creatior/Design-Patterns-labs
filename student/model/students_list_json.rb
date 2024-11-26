require "json"
require_relative "students_list.rb"

# class for working with json file
class Students_list_JSON < Students_list
  # read from json
  def read
    print File.exist?(self.file_path)
    return [] unless File.exist?(self.file_path)
    JSON.parse(File.read(self.file_path), symbolize_names: true).map do |data|
        Student.new(**data)
    end
  end

  # write to json
  def write
    data = self.students.map { |student| student.to_h }
    File.open(self.file_path, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end 
end