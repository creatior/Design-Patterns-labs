require 'minitest/autorun'
require './array_proc.rb'

class Array_proc_test < Minitest::Test
	attr_reader :proc
	
	# Установка начальных данных
	def setup
		@proc = Array_proc.new([13, -14, 15, 16, -17, 18, -19, 20])
	end
	
	def test_chunk
		result = proc.chunk {|num| (num / 3).abs.floor}
		expected_result = [
			[4, [13]], 
			[5, [-14, 15, 16]], 
			[6, [-17, 18]], 
			[7, [-19]], 
			[6, [20]]
		]
		assert_equal(expected_result, result.to_a)
	end
	
	def test_include?
		result = proc.include? {|x| x < -10}
		expected_result = true
		assert_equal(expected_result, result)
	end
	
	def test_reduce
		result = proc.reduce {|accumulator, num| accumulator + num}
		expected_result = 32
		assert_equal(expected_result, result)
	end
		
	def test_sum
		result = proc.sum {|x| x < 0}
		expected_result = -50
		assert_equal(expected_result, result)
	end
		
	def test_member?
		result = proc.include? {|x| x > 30}
		expected_result = false
		assert_equal(expected_result, result)
	end
	
	def test_filter
		result = proc.filter {|x| x.abs % 3 == 0}
		expected_result = [15, 18]
		assert_equal(expected_result, result)
	end
end