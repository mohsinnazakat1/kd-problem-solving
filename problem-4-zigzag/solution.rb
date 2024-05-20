def convert(s, numRows)
    return s if numRows == 1 || s.length <= numRows
  
    rows = Array.new(numRows, "")

    cur_row = 0
    going_down = false
  
    s.each_char do |char|
      rows[cur_row] += char
  
      if cur_row == 0
        going_down = true
      elsif cur_row == numRows - 1
        going_down = false
      end
  
      if going_down
        cur_row += 1
      else
        cur_row -= 1
      end
    end
  
    rows.join
  end
  
  puts convert("PAYPALISHIRING", 3) #PAHNAPLSIIGYIR
  puts convert("PAYPALISHIRING", 4) #PINALSIGYAHRPI
  puts convert("A", 1)