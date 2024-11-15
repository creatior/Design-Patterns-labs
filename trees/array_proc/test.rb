require "./array_proc.rb"
#array = Array_proc.new([12, 43, 23, 12, 76, 89, 54, 34])

array = Array_proc.new([13, -14, 15, 16, -17, 18, -19, 20])
puts array.reduce {|acc, num| acc + num}
