# Misspelling is an art form that students seem to excel at.
# Write a program that removes the nth character from an input string.
#
# Input
# ------
# The first line of input contains a single integer N, (1 ≤ N ≤ 1000) which is the number of datasets that follow.
#
# Each dataset consists of a single line of input containing M, a space, and a single word made up of uppercase letters only.
# M will be less than or equal to the length of the word. The length of the word is guaranteed to be less than or equal to 80.

# Output
# ------
# For each dataset, you should generate one line of output with the following values: The dataset number as a decimal integer (start counting at one), a space, and the misspelled word. The misspelled word is the input word with the indicated character deleted.
# Example
#
# Input:
# 4
# 4 MISSPELL
# 1 PROGRAMMING
# 7 CONTEST
# 3 BALLOON
#
# Output:
# 1 MISPELL
# 2 ROGRAMMING
# 3 CONTES
# 4 BALOON

n = gets.to_i

if( n <= 0 or n >= 1000 )
  puts 'Number n should be less than 1 <= n <= 1000'
  exit
end

puts
i = 1
result = []

while i <= n

  input = gets.match(/(^\d+)\s([A-Z]+$)/)
  num = $1.to_i
  string = $2

  condition = ( ( input != nil ) and ( string.size <= 80 ) and ( num <= string.size ) )

  if( condition )
    string[num-1] = ''
    result << [i, string]
  i += 1
  else
    puts 'Formate should be "M STRING" &  M < STRING.size'
  end

end

puts

puts result.collect{|num, string| "#{num} #{string}" }.join("\n")
