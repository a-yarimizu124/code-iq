# 【 カードを使って数を作ろう（簡単編） 】
#https://codeiq.jp/q/2819
#
# カードが何枚かあります。
# カードには、一桁の数字が書いてあります。
# カードをn枚選んで並べて数を作ります。
# たとえば、「3」「1」「4」「1」「5」が書いてあるカードから 3枚(つまり、n=3)を選んで並べると「341」や「115」を作ることができます( 「334」や「31」は作れません）。
# 作れる数のうち、ある数 m にもっとも近い数を答えてください。
#
# 入力は、コンマ区切りで、n(カードの枚数)、m(この値に近い数を作る)、カード列 が並んでいます。
# カード列は、カードに書いてある数字をスラッシュ区切りで並べたものです。
# 出力は、最も近い数が2つある場合は、小さい順に両方共出力してください。
# 末尾の改行はあってもなくても構いません。
# 作れる数がひとつもない場合には、-を出力してください。
#
# 「01」のような、「0」で始まる二桁以上の数は作れません。一桁の「0」はOKです。
# カードの枚数は8枚以下です。
# n は 1以上で、カードの枚数を超えることはありません。
# m は 0以上、10の9乗以下です。
# 6 のカードを逆さにして 9 として使ったりすることはできません。
# 不正な入力に対処する必要はありません。
#
# 【 入出力サンプル 】
# Input----------------------
#   4,1234,1/2/2/3/3/5/5
# ---------------------------
# Output---------------------
#   1233,1235
# ---------------------------

line = gets
# "4,1234,1/2/3/4" → "4","1234","1/2/3/4"
line = line.split(",")
# "0","0","0","0" line[2] を区切る
card = line[2].split("/")
line.map!{|l| l.to_i}
card.map!{|c| c.to_i}

# ２行目　→　求める数を　second_line　に入れておく
second_line = line[1]

# 順列を作成して、重複を消す
card = (card.permutation(line.first).to_a).uniq

# ”0” からはじまる組を削除したい！
card.delete_if {|d| d[0] == 0} if line.first > 1

# "1","2","3","4" →　"1234" 配列内を結合
card = card.collect{|e|
  e.join.to_i
}

card.sort!
# puts card.inspect


# min_card <= second_line <= max_card となるような second_line に近い２つの数を求める
max_card = 0
min_card = nil

card.each{|e2|
  max_card = e2 if max_card < e2
  break if second_line <= e2
  min_card = e2
}



if min_card.nil? then
  if max_card == 0 then
    # puts 4
    puts "-"
  else
    # puts 1
    puts max_card
  end

elsif (max_card - second_line).abs < (min_card - second_line).abs then
  # puts 2
  puts max_card

elsif (min_card - second_line).abs < (max_card - second_line).abs then
  # puts 3
  puts min_card

# max_card と min_card が同じ時
elsif min_card == max_card then
  # puts 5
  puts max_card

# 両方が同じだけ近い時
elsif (min_card - second_line).abs == (max_card - second_line).abs then
  # puts 6
  puts "#{min_card},#{max_card}"

end
