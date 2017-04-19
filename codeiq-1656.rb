# 【 言語不問：素数で度数分布表を作ろう！ 】
# https://codeiq.jp/p/1656
#
# 入力として2つの正の整数が与えられます。
# 一つ目は分布させる素数の最大値(最大20000)、二つ目は区切りの大きさです。
#
# 【 入出力サンプル 】
# Input----------------------
#   30 5
# ---------------------------
# Output---------------------
#   01-05:***
#   06-10:*
#   11-15:**
#   16-20:**
#   21-25:*
#   26-30:*
# ---------------------------


# 入力値を 分布させる素数の最大値(n_max) と 区切りの大きさ(range) に分ける
def in_Str(str)
  s = str.rpartition(/\s/)
  m = s.first.to_i
  r = s.last.to_i

  return m,r
end

# 最大値までの素数を出す
def erato(x)
  return [] if x <= 2
  list = (2...x).to_a
  primes =[]
  sqrt = Math.sqrt(x)

  while sqrt > list.first
    primes << list.shift

    list.delete_if{ |a|
      a % primes.last == 0
    }
  end

  primes.concat(list)

end

# 素数を区切る
def split_prime(n, prim, rang)
  num = rang

  len = n.to_s.length
  star_count = 0

  prim.each{ |e|
    if e <= num then
      star_count+=1
    else
      puts format("%0#{len}d-%0#{len}d:#{'*'*star_count}", num-rang+1, num)
      num = num + rang
      star_count = 0
      redo
    end
  }

  puts format("%0#{len}d-%0#{len}d:#{'*'*star_count}", num-rang+1, num)


end


line = gets.chomp

n_max, range = in_Str(line)

prime = erato(n_max)
split_prime(n_max, prime,range)
