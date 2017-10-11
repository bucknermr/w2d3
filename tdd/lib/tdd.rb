def my_uniq(array)
  result = []

  array.each { |el| result << el unless result.include?(el) }

  result
end

def two_sum(array)
  pairs = []

  (0...array.length - 1).each do |i|
    (i + 1...array.length).each do |j|
      pairs << [i, j] if array[i] + array[j] == 0
    end
  end

  pairs
end

def my_transpose(arr)
  transposed = Array.new( arr.length ) { Array.new(arr[0].length) }

  arr.length.times do |row_idx|
    arr.length.times do |col_idx|
      transposed[col_idx][row_idx] = arr[row_idx][col_idx]
    end
  end

  transposed
end

def stock_picker(array)
  raise "need at least two days" if array.length < 2
  result = [0, 1]

  (1...array.length - 1).each do |day1|
    (day1 + 1...array.length).each do |day2|
      current_dif = array[result.last] - array[result.first]
      if array[day2] - array[day1] > current_dif
        result = [day1, day2]
      end
    end
  end

  result
end
