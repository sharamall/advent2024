require 'byebug'

file = File.open "day1in.txt"

a = []
b = []
file.each_line do |l|
  erm1, erm2 = l.split(" ").filter { |it| it != " " }
  a << erm1.to_i
  b << erm2.to_i
end
sim = 0
a.each do |arg|
  sim += arg * b.count { |it| it == arg }
end
puts sim