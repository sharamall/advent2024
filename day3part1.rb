file = File.open "day3in.txt"

out = 0
file.each_line do |l|
  caps = l.scan(/mul\((\d\d?\d?),(\d\d?\d?)\)/)
  ints = caps.collect { |arr| arr.collect(&:to_i) }
  ints.each do |pair|
    out += pair[0] * pair[1]
  end
end

puts out