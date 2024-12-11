require "./model/filters/filter.rb"

class Decorator < Filter

  def initialize(filter)
    self.filter = filter
  end

  def apply(filtering_obj)
    self.filter.apply(filtering_obj)
  end

  private
  attr_accessor :filter

end