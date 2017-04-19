# 【 言語不問：マイナンバーに対応しよう 】
#https://codeiq.jp/q/2007
#
# 12桁の個人番号のうち、1桁はチェックデジットです。
# チェックデジットを正しく計算するプログラムを作成してください。
# なお、計算式については、以下のURLに「検査用数字を算出する算式」として規定されています。
# https://codeiq.jp/sites/default/files/answer_ready/2007/mynumber.html
#
# 標準入力から与えられた内容について、以下の処理を行うことにします。
# (1) 数字11桁の場合、マイナンバーのチェックデジット1桁を出力
# (2) 数字12桁の場合、チェックデジットの値が正しければOK、間違っていればNGを出力
# (3) 数字以外が入っている、もしくは11桁や12桁でない場合、Errorと出力
#
# 【 入出力サンプル 】
# Input----------------------
#   1234567890
#   12345678901
#   123456789012
#   123456789018
#   1234567890123
#   abcdefghijk
# ---------------------------
# Output---------------------
#   Error
#   8
#   NG
#   OK
#   Error
#   Error
# ---------------------------


def Decision(num)
# 13桁以上？
  if num.length > 13
    # puts "Error_Over13"
    return false
  end

# 10桁以下？
  if num.length <= 11
    # puts "Error_Under11"
    return false
  end

# ローマ字が入ってるか？
  unless /^[0-9]+$/ =~ num
    # puts "Error_Eng"
    return false
  end

  return true
end


def Split_line(num)
  pn = num.chomp.split("")
  pn.map!{|e| e.to_i}
  return pn
end


def Check_Digit(num)
  s=0
  qn = [6,5,4,3,2,7,6,5,4,3,2]

  for n in 0..10 do
    s += num[n].to_i * qn[n]
  end

  digit = (11 - s) % 11
    return digit
end



while (line = gets) do
  if Decision(line) == false
    puts "Error"
    next
  end

  d = Split_line(line)

  if d.size == 11
    puts Check_Digit(d)
  elsif d.size == 12
    if Check_Digit(d) == d.last
      puts "OK"
    else
      puts "NG"
    end
  end
end
