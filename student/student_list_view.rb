require './model/data_list/data_list_student_short.rb'
require './model/student/student.rb'
require './model/student_short/student_short.rb'
require 'fox16'
include Fox

class Student_list_view < FXVerticalFrame

  ROWS_PER_PAGE = 4

  def initialize(parent)
    super(parent, opts: LAYOUT_FILL)

    create_filtering_area
    create_table_area
  end

  def create_filtering_area
    filtering_area = FXVerticalFrame.new(self, opts: LAYOUT_FILL_X | LAYOUT_SIDE_TOP)
    FXLabel.new(filtering_area, "Filtration")

    matrix = FXMatrix.new(filtering_area, 3, opts: MATRIX_BY_COLUMNS | LAYOUT_FILL_X)

    # Добавляем первую строку с меткой и текстовым полем
    FXLabel.new(matrix, "Surname and initials:")
    FXTextField.new(matrix, 20, opts: TEXTFIELD_NORMAL)
    FXLabel.new(matrix, "")
    # Добавляем остальные строки
    add_filtering_row(matrix, "Git:")
    add_filtering_row(matrix, "Email:")
    add_filtering_row(matrix, "Phone number:")
    add_filtering_row(matrix, "Telegram:")
  end

  def add_filtering_row(matrix, label)
    FXLabel.new(matrix, label)
    combo = FXComboBox.new(matrix, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN)
    combo.numVisible = 3
    combo.appendItem("No matter")
    combo.appendItem("Yes")
    combo.appendItem("No")
    text_field = FXTextField.new(matrix, 15, opts: TEXTFIELD_NORMAL)
    text_field.enabled = false

    combo.connect(SEL_COMMAND) do
      text_field.enabled = (combo.currentItem == 1)
    end
  end

  def create_table_area
    table_area = FXVerticalFrame.new(self, opts: LAYOUT_FILL)

    self.table = FXTable.new(table_area, opts: LAYOUT_FILL | TABLE_READONLY | TABLE_COL_SIZABLE)
    self.table.setTableSize(ROWS_PER_PAGE, 4)
    self.table.rowHeaderMode = LAYOUT_FIX_WIDTH
    self.table.rowHeaderWidth = 30

    controls = FXHorizontalFrame.new(table_area, opts: LAYOUT_FILL_X)
    self.prev_button = FXButton.new(controls, "<", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.page_label = FXLabel.new(controls, "Страница: 1/1", opts: LAYOUT_CENTER_X)
    self.next_button = FXButton.new(controls, ">", opts: BUTTON_NORMAL | LAYOUT_RIGHT)

    populate_table
    self.prev_button.connect(SEL_COMMAND) { switch_page(-1) }
    self.next_button.connect(SEL_COMMAND) { switch_page(1) }

    self.table.columnHeader.connect(SEL_COMMAND) do |_, _, column_index|
      sort_table_by_column(column_index)
    end
  end

  private
  attr_accessor :table, :prev_button, :page_label, :next_button, :data, :total_pages, :current_page, :sort_order

  def populate_table
    data_list = Data_list_student_short.new([
      Student_short.from_student(student: Student.new(surname: "Воробьев", first_name: "Артем", last_name: "Олегович", git: "https://github.com/creatior", id: 5, telegram: "@artyomvor", birthdate: "25.09.2004")),
      Student_short.from_student(student: Student.new(surname: "Вавакин", first_name: "Владислав", last_name: "Олегович", git: "https://github.com/VavakinV", id: 5, telegram: "@Renbhed", birthdate: "16.06.2004")),
      Student_short.from_student(student: Student.new(surname: "Иванченко", first_name: "Павла", last_name: "Андреевна", git: "https://github.com/eatdetey", id: 5, telegram: "@eatdetey", birthdate: "12.11.2004")),
      Student_short.from_student(student: Student.new(surname: "Смирнов", first_name: "Никита", last_name: "Олегович", git: "https://github.com/ZaiiiRan", id: 1, telegram: "@zaiiran", phone_number: "89654251232", birthdate: "03.06.2004")),
      Student_short.from_student(student: Student.new(surname: "Блягоз", first_name: "Амаль", last_name: "Хазретович", git: "https://github.com/lamafout", id: 2, telegram: "@lamafout", email: "lamafout@gmail.com", birthdate: "14.06.2004")),
    ])
    data_list.select(0)
    data_list.select(1)
    data_list.select(2)
    data_list.select(3)
    data_list.select(4)
    self.data = data_list.get_data
    self.total_pages = ((self.data.row_count - 1).to_f / ROWS_PER_PAGE).ceil
    self.current_page = 1
    update_table
  end

  # update table
  def update_table(sorted_data = nil)
    return if self.data.nil? || self.data.row_count <= 1
    (0...self.data.column_count).each do |col_index|
      self.table.setColumnText(col_index, self.data.get(0, col_index).to_s)
    end
    clear_table
    data_to_display = sorted_data || get_page_data(self.current_page)
    data_to_display.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        self.table.setItemText(row_index, col_index, cell.to_s)
      end
    end
    self.page_label.text = "Страница: #{self.current_page}/#{self.total_pages}"
  end

  # clear table
  def clear_table
    (0...ROWS_PER_PAGE).each do |row_index|
      (0...self.data.column_count).each do |col_index|
        self.table.setItemText(row_index, col_index, "")
      end
    end
  end

  # getting data for page
  def get_page_data(page_number)
    start_index = (page_number - 1) * ROWS_PER_PAGE + 1
    end_index = start_index + ROWS_PER_PAGE - 1
    data_page = []

    (start_index..end_index).each do |row_index|
      break if row_index >= self.data.row_count
      row = []
      (0...self.data.column_count).each do |col_index|
        row << self.data.get(row_index, col_index)
      end
      data_page << row
    end
    data_page
  end

  # switch page
  def switch_page(direction)
    new_page = self.current_page + direction
    return if new_page < 1 || new_page > self.total_pages
    self.current_page = new_page
    update_table
  end

  # sort
  def sort_table_by_column(column_index)
    return if self.data.nil? || self.data.row_count <= 1

    headers = (0...self.data.column_count).map { |col_index| self.data.get(0, col_index) }

    rows = (1...self.data.row_count).map do |row_index|
      (0...self.data.column_count).map { |col_index| self.data.get(row_index, col_index)}
    end

    self.sort_order ||= {}
    self.sort_order[column_index] = !sort_order.fetch(column_index, false)

    sorted_rows = rows.sort_by { |row| row[column_index] }
    sorted_rows.reverse! unless self.sort_order[column_index]

    all_rows = [headers] + sorted_rows

    self.data = Data_table.new(all_rows)
    update_table
  end

end