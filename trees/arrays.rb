# 4, 16, 28, 40, 52

def sort_indeces_decrease(array)
	indices = (0...array.size).to_a
	indices.sort_by{|i| -array[i]}
end

def elements_between_first_and_second_maxs(array)
	max1, max2 = array.max(2)

	max1_index = array.index(max1)
	max2_index = array.index(max2)

	min_index = [max1_index, max2_index].min
	max_index = [max1_index, max2_index].max

	array[(min_index + 1)..(max_index - 1)]
end

def elements_between_first_and_last_maxs(array)
	max_value = array.max

	first_max_index = array.index(max_value)
	last_max_index = array.rindex(max_value)

	array[(first_max_index + 1)..(last_max_index - 1)]
end

def min_even_element(array)
	even_elements = array.select { |element| element.even? }
	even_elements.min
end

array = [43, 52, 54, 13, 87, 43, 13, 65, 155]
#puts sort_indeces_decrease(array).inspect

#puts elements_between_first_and_second_maxs(array).inspect

#puts elements_between_first_and_last_maxs(array).inspect

puts min_even_element(array)