# Нахождение минимального элемента в массиве
def minElement (array)
	min = 100000
	for x in array
		if x < min
			min = x
		end
	end
	min
end

# Нахождение индекса первого положительного элемента массива
def firstPositiveElement (array)
	i = 0
	while i < array.size
		if array[i] > 0
			return i + 1
		end
		i += 1
	end
	-1
end