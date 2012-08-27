def num_to_lcd_rows(num, size)
  ssd_map = [
    #t, tl, tr, m, bl, br, b
  	[1,1,1,0,1,1,1], #0
  	[0,0,1,0,0,1,0], #1
  	[1,0,1,1,1,0,1], #2
  	[1,0,1,1,0,1,1], #3
  	[0,1,1,1,0,1,0], #4
  	[1,1,0,1,0,1,1], #5
  	[1,1,0,1,1,1,1], #6
  	[1,0,1,0,0,1,0], #7
  	[1,1,1,1,1,1,1], #8
  	[1,1,1,1,0,1,1], #9
  ]
	rows = []
	ssd = ssd_map[num]
	rows << (" " + (ssd[0] == 1 ? "-" : " ") * size + " ")
	size.times do |i|
    rows << ((ssd[1] == 1 ? "|" : " ") + " " * size + (ssd[2] == 1 ? "|" : " "))
  end
  rows << (" " + (ssd[3] == 1 ? "-" : " ") * size + " ")
  size.times do |i|
    rows << ((ssd[4] == 1 ? "|" : " ") + " " * size + (ssd[5] == 1 ? "|" : " "))
  end
  rows << (" " + (ssd[6] == 1 ? "-" : " ") * size + " ")
end

def print_digit_str(str, size)
  rows = []
  str.each_char.select{|char| char =~ /\d/ }.each do |char|
    num_to_lcd_rows(char.to_i, size).each_with_index do |str, idx|
      rows[idx] = rows[idx].nil? ? str : rows[idx] << " " << str
    end
  end
  puts rows.join("\n")
end

print_digit_str("1234567890", 3)