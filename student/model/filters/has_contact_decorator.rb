require "./model/filters/decorator.rb"

class Has_contact_decorator < Decorator
  def initialize(filter)
    super(filter)
  end

  def apply(filtering_obj)
    if filtering_obj.is_a?(Array)
      super(filtering_obj).select do |student|
        student.is_telegram_valid?(student.telegram) || student.is_email_valid?(student.email) || student.is_phone_valid?(student.phone)
      end
    else 
      query = super(filtering_obj)
      condition = query.include?("WHERE") ? "AND" : "WHERE"
      "#{query} #{condition} (phone IS NOT NULL OR email IS NOT NULL OR telegram IS NOT NULL)"
    end
  end
end