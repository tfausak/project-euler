# http://projecteuler.net/problem=15
size = 20
routes = 2 * size
row = routes + 1
(2..size).each do |n|
  routes *= (row - n) / n.to_f
end
puts routes.to_i
