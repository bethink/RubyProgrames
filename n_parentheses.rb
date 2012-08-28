# =================== SAMPLE INPUTS & ITS RESULTS
#
#    1 => ()
#
#    2 => ()() | (())
#
#    3 =>
#
#    ()()()
#
#    ()(())	(())()
#
#    ((()))
#
#    4 =>
#
#    ()()()()
#
#    ()()(())		()(())()		(())()()		(())(())
#
#    ((()))()		()((()))
#
#    (((())))


print "\nEnter a number(n): "
n = gets().to_i

array = (0..n).to_a.repeated_combination(n).reject do |i|
  i.delete(0);
  i.inject(:+) != n
end.collect{|i| i.permutation.to_a.uniq }.flatten(1)

def n_paranthesis_string(n)
  s = ''
  n.times do
    s << '('
  end

  n.times do
    s << ')'
  end

  s
end



result = array.collect do |ar|
	s = ''
	ar.each do |i|
		s  << n_paranthesis_string(i)
	end
s
end.reverse.join(' , ')

puts "\nResult:"
puts result
puts
