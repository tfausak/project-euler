# http://projecteuler.net/problem=11
size = 4
max = 0

grid = File.read(ARGV[0]).collect do |line|
  line.split.collect { |number| number.to_i }
end

grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    next if i + size >= grid.length || j + size >= row.length || j - size < 0
    a = b = c = d = cell
    (1...size).each do |k|
      a *= grid[i][j + k];
      b *= grid[i + k][j];
      c *= grid[i + k][j + k];
      d *= grid[i + k][j - k];
    end
    max = [max, a, b, c, d].max
  end
end

puts max
