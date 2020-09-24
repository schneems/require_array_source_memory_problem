require_relative 'array_from_file.rb'
require 'fileutils'
FileUtils.mkdir_p('split')

HUGE_ARRAY_FROM_FILE.each_slice(HUGE_ARRAY_FROM_FILE.size/20).each_with_index do |array, i|
  File.open("split/array_part_from_file_#{i}.rb", "w") do |f|
    if i == 0
      f.write("$huge_array_split = []\n")
    end

    f.write("$huge_array_split += [\n")
    array.each_slice(10) do |x|
      f.write(x.join(', ') + ",\n")
    end
    f.write("]\n")
  end
end
