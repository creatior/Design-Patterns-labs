require './model/data_list/data_list_student_short.rb'
require './model/student/student.rb'
require './model/student/student_short.rb'
require './controllers/student_list_controller.rb'
require 'fox16'
include Fox

class Student_list_view < FXVerticalFrame
  attr_accessor :controller, :current_page, :items_per_page

  def initialize(parent)
    super(parent, opts: LAYOUT_FILL)

    self.controller = Student_list_controller.new(self)
    self.items_per_page = 16

    create_filtering_area
    create_table_area
    create_buttons_area

    refresh_data
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
    self.table.setTableSize(self.items_per_page, 4)
    self.table.rowHeaderMode = LAYOUT_FIX_WIDTH
    self.table.rowHeaderWidth = 30

    self.table.setColumnWidth(0, 30)
    self.table.setColumnWidth(1, 120)
    self.table.setColumnWidth(2, 200)
    self.table.setColumnWidth(3, 180)

    controls = FXHorizontalFrame.new(table_area, opts: LAYOUT_FILL_X)
    self.prev_button = FXButton.new(controls, "<", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.page_label = FXLabel.new(controls, "Страница: 1/1", opts: LAYOUT_CENTER_X)
    self.next_button = FXButton.new(controls, ">", opts: BUTTON_NORMAL | LAYOUT_RIGHT)

    self.prev_button.connect(SEL_COMMAND) { switch_page(-1) }
    self.next_button.connect(SEL_COMMAND) { switch_page(1) }

    self.table.columnHeader.connect(SEL_COMMAND) do |_, _, column_index|
      sort_table_by_column(column_index)
    end
  end

  def create_buttons_area
    buttons_area = FXVerticalFrame.new(self, opts: LAYOUT_FILL)

    controls = FXHorizontalFrame.new(buttons_area, opts: LAYOUT_FILL_X)
    self.add_button = FXButton.new(controls, "Add", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.update_button = FXButton.new(controls, "Update", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.delete_button = FXButton.new(controls, "Delete", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.refresh_button = FXButton.new(controls, "Refresh", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    self.refresh_button.connect(SEL_COMMAND) { refresh_data }


    self.table.connect(SEL_SELECTED) { refresh_buttons }
    self.table.connect(SEL_DESELECTED) { refresh_buttons }

    refresh_buttons
  end

  def set_table_params(column_names, entries_count)
    column_names.each_with_index do |name, index|
      self.table.setItemText(0, index, name)
    end
    self.total_pages = (entries_count / self.items_per_page.to_f).ceil
    self.page_label.text = "Страница #{self.current_page} из #{self.total_pages}"
  end

  def set_table_data(input_data_table)
    clear_table
    (0...input_data_table.row_count).each do |row|
      (0...input_data_table.column_count).each do |col|
        self.table.setItemText(row, col, input_data_table.get(row, col).to_s)
      end
    end
  end

  def show_error_message(message)
    if self.created?
      FXMessageBox.error(self, MBOX_OK, "Ошибка", message)
    else
      puts "Ошибка: #{message}"
    end
  end

  private
  attr_accessor :table, :prev_button, :page_label, :next_button, :data, :total_pages, :sort_order, :add_button, :update_button, :delete_button, :refresh_button

  # clear table
  def clear_table
    (0...self.table.numRows).each do |row_index|
      (0...self.table.numColumns).each do |col_index|
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
    self.controller.refresh_data
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

  def get_selected_rows
    selected_rows = []
    (0...self.table.numRows).each do |row|
      selected_rows << row if self.table.rowSelected?(row)
    end
    selected_rows
  end

  def refresh_buttons
    selected_rows = get_selected_rows
    self.add_button.enabled = true
    self.refresh_button.enabled = true

    if selected_rows.size == 0
      self.update_button.enabled = false
      self.delete_button.enabled = false
    elsif selected_rows.size == 1
      self.update_button.enabled = true
      self.delete_button.enabled = true
    else
      self.update_button.enabled = false
      self.delete_button.enabled = true
    end

  end

  def refresh_data
    self.current_page = 1
    self.controller.refresh_data
  end

end