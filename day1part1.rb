require 'byebug'

file = File.open "day1in.txt"

a = []
b = []
file.each_line do |l|
  erm1, erm2 = l.split(" ").filter { |it| it != " " }
  a << erm1.to_i
  b << erm2.to_i
end
a.sort!
b.sort!
dist = 0
a.each_with_index do |arg, i|
  dist += (arg - b[i]).abs
end
puts dist