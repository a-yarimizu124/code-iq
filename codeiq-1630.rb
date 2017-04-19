# 【 言語不問：「7」の数を数えよう 】
# https://codeiq.jp/q/1630
#
# 1からnまで連続する正の整数があります。
# それらの中に「7」がいくつあるかを数えてください。
# n = 99とすると「7」を含む値は、
# 7 17 27 37 47 57 67 70 71 72 73 74 75 76 77 78 79 87 97
# の19個ですが、77には「7」が2つ含まれています。
# ですので、「7」の数は19個ではなく、20個と答えてください。なお、nは32bit整数に収まるものとします。
#
# 【 入出力サンプル 】
# Input----------------------
#   7
#   99
# ---------------------------
# Output---------------------
#   1
#   20
# ---------------------------

def count_seven(num)
    return 0 if num.empty?

    i = num.size.to_i
    n = num.shift.to_i
    n_join = num.join.to_i


    if n > 7 then
      ans = (i - 1) * (10**(i - 2)) * n + (10**(i-1))
    elsif n < 7 then
      ans = (i - 1) * (10**(i - 2)) * n
    elsif n == 7 then
      ans = (i - 1) * (10**(i - 2)) * n + n_join + 1
    end
    ans + count_seven(num)
end


while(line = gets) do
  num = line.chomp.split("")

  ans = count_seven(num).to_i

  puts ans
end
