require "./views/student_list_view.rb"
require 'fox16'

include Fox

class App < FXMainWindow

  def initialize(app)
    super(app, "Students", width: 1024, height: 766)

    tabs = FXTabBook.new(self, opts: LAYOUT_FILL)

    FXTabItem.new(tabs, "List of students")
    student_list = FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
    Student_list_view.new(student_list)

    FXTabItem.new(tabs, "empty")
    FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)

    FXTabItem.new(tabs, "empty")
    FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
  
end