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


# === Generate all the combination of array of integers. 
# === Each array sum in equal to 'n'
n_permutations = (0..n).to_a.repeated_combination(n).reject do |i|
  is_equal_sum_n = ( i.inject(:+) == n )
  i.delete(0) if is_equal_sum_n
  !is_equal_sum_n
end.collect{|i| i.permutation.to_a.uniq }.flatten(1)


# ======== n_paranthesis_string(3) => '((()))'
# ======== n_paranthesis_string(2) => '(())'
# ======== n_paranthesis_string(1) => '()'
def n_paranthesis_string(n)
  paranthesis_string = ''
  n.times{ paranthesis_string << '(' }
  n.times{ paranthesis_string << ')' }
  paranthesis_string
end

resultant_string = n_permutations.collect do |permutation_i|
  result = ''
  permutation_i.each do |i|
	result << n_paranthesis_string(i)
  end
  result
end.reverse.join(' | ')

puts
puts resultant_string
puts 
