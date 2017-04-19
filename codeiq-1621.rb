# 【 言語不問：素数の数を数えてください 】
#https://codeiq.jp/q/1621
#
# 与えられた数字よりも小さい数字の中で、
# 素数がいくつあるかを調べるプログラムを作ってください。
#
# 【 入出力サンプル 】
# Input----------------------
#   5
#   10
# ---------------------------
# Output---------------------
#   2
#   4
# ---------------------------

moji = Array.new()

while(line = gets) do
  moji << line.to_i
end


def erato(x)
  list = (2...x).to_a
  primes =[]
  sqrt = Math.sqrt(x)


  begin
    primes << list.shift

    list.delete_if{ |a|
      a % primes.last == 0
    }
  end while sqrt >= list.first

  primes + list
end

  prime = erato(100000)


moji.each{|e|
  ans = prime.take_while{|t| t < e}
  puts ans.size
}
