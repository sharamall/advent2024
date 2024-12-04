file = File.open "day2in.txt"

reports = []
file.each_line do |l|
  lmao = l.split(" ").filter { |it| it != " " }.map(&:to_i)
  reports << lmao
end

def is_arr_safe(arr)
  dir = :dir
  has_changed_dir = false
  valid = true
  previous = arr[0]
  arr[1..].each do |val|
    new_dir = val > previous ? :inc : (val < previous ? :dec : :dir)
    has_changed_dir = true if new_dir != dir && dir != :dir
    dir = new_dir
    diff = (val - previous).abs
    if has_changed_dir || (diff < 1 || diff > 3)
      valid = false
      break
    end
    previous = val
  end
  valid
end

def is_safe(orig)
  safes = []
  (0..(orig.length - 1)).each do |index|
    safes << is_arr_safe(orig.dup.tap { |new_arr| new_arr.delete_at(index) })
  end
  safes << is_arr_safe(orig)
  safes.any?
end

count = 0
reports.each_with_index do |var, i|
  a = is_safe(var)
  puts "#{i} is #{a}"
  count += 1 if a
end

puts count