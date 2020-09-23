HUGE_ARRAY_FROM_FILE = []

File.open("array.txt".freeze).each_line do |line|
  HUGE_ARRAY_FROM_FILE << line.to_i
end

