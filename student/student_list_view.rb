require 'fox16'
include Fox

class Student_list_view < FXVerticalFrame

  def initialize(parent)
    super(parent, opts: LAYOUT_FILL)

    create_filtering_area
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

end