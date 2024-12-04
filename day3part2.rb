file = File.open "day3in.txt"

out = 0
enabled = true
file.each_line do |l|
  caps = l.scan(/(mul\((\d\d?\d?),(\d\d?\d?)\))|(do\(\))|(don't\(\))/).map(&:compact)
  caps.each do |no_kappa|
    if no_kappa[0] == "don't()"
      enabled = false
    elsif no_kappa[0] == "do()"
      enabled = true
    elsif enabled
      a, b = [no_kappa[1].to_i, no_kappa[2].to_i]
      out += a * b
    end
  end
end

puts out