# 【 言語不問：プラマイゼロは何通り？ 】
#https://codeiq.jp/q/1946
#
# 標準入力から整数が一行に一つ入力されます。
# 入力された値から2つを選んだとき、それらの和がゼロになるような組み合わせが何通りあるかを求めてください。
# （入力される数字はすべて異なるものとします。）
#
# 【 入出力サンプル 】
# Input----------------------
#   1
#   5
#   -3
#   3
#   -2
#   -5
#   10
# ---------------------------
# Output---------------------
#   2
# ---------------------------

moji = Array.new()
ans = 0

while(line = gets) do
  line
  moji << (line.to_i).abs

end


def q_sort(a, left, right)
  return a if left >= right

  pivot = a[((left + right).to_f/2.to_f).ceil]
  i = left
  j = right

  while true
    i += 1 while a[i] < pivot
    j -= 1 while a[j] > pivot

    break if (i >= j)
    a[i], a[j] = a[j], a[i]
    i += 1
    j -= 1
  end
  q_sort(a, left, i-1)
  q_sort(a, i, right)
end

q_sort(moji,0,moji.count-1)

for n in 1...(moji.count) do
  ans+=1 if moji[n-1] == moji[n]
end


puts ans
