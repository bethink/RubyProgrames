require 'ruby-prof'
RubyProf.measure_mode = RubyProf::MEMORY
# =============== Optimized for Memory

a = Time.now

result1 = RubyProf.profile do

  i = 0

  array = 0

  while i <= 100000
    array += (i+=3)
    puts i
    array += (i+=3)
    puts i
    array += (i+=3)
    puts i
    array += (i+=3)
    puts i
    array += (i+=3)
    puts "#{i} ==="
  end

  puts array

end

b = Time.now

# =============== Optimized for CPU

x = Time.now

result2 = RubyProf.profile do

  i = 0

  str = ""
  array = 0

  while i <= 100000
    array += (i+=3)
    str < "#{i}\n"
    array += (i+=3)
    str < "#{i}\n"
    array += (i+=3)
    str < "#{i}\n"
    array += (i+=3)
    str < "#{i}\n"
    array += (i+=3)
    str < "#{i} ===\n"
  end

  puts str
  puts array

end

y = Time.now

puts "Time 1: #{b-a}"
puts "Time 2: #{y-x}"

puts "========== for R1"
printer = RubyProf::FlatPrinter.new(result1)
printer.print(STDOUT)

puts "========== for R2"
printer = RubyProf::FlatPrinter.new(result2)
printer.print(STDOUT)

