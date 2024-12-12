require 'fox16'

include Fox

class App < FXMainWindow

  def initialize(app)
    super(app, "Students", width: 1024, height: 768)
    
    tabs = FXTabBook.new(self, opts: LAYOUT_FILL)
    tab1 = FXTabItem.new(tabs, "List of students")
    frame1 = FXHorizontalFrame.new(tabs, opts: LAYOUT_FILL)

    students_list_view(frame1)
    
    FXTabItem.new(tabs, "empty")
    FXHorizontalFrame.new(tabs, opts: LAYOUT_FILL)

    FXTabItem.new(tabs, "empty")
    FXHorizontalFrame.new(tabs, opts: LAYOUT_FILL)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
  
  def students_list_view(parent)
    FXLabel.new(parent, "list of students will be fine . . .")
  end
  
end