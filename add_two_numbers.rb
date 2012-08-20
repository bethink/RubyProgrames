a = gets.to_i
b = gets.to_i
if a > 0 and a < 2100000000 and b > 0 and b < 2100000000
  puts
  p a.to_i + b.to_i
else
  p 'a and b should be "0 < a, b <2100000000"'
end

