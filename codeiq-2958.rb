# 【 不要なスペースを除去して、文字列を整形しよう 】
# https://codeiq.jp/q/2958
#
# 標準入力から、英数字、スペース、句読点（後述）のいずれかのみで構成された英文が送られる
# 文字列の長さは80以下とする
# 文字列の先頭および末尾から続くスペースは除去の対象する
# 先頭および末尾を処理した文字列の中で、2文字以上連続するスペースは、1スペースを残し、残るスペースは除去の対象とする
# 句読点はピリオド(.)、カンマ(,）、疑問符(?)のいずれかとし、句読点の直前にあるスペースは除去対象とする
# 上記ルールにもとづき、スペースを除去した文字列を標準出力に返すこと
#
# 【 入出力サンプル 】
# Input----------------------
#     Hello  ,  CodeIQ.
# ---------------------------
# Output---------------------
#   Hello, CodeIQ.
# ---------------------------

def canma(str)

  str.gsub!(/\s\./, ".")
  str.gsub!(/\s\,/, ",")
  str.gsub!(/\s\?/, "?")

  return str
end

line = gets

line.strip!

line.gsub!(/\s+/," ")


canma(line) if /[.,?]/ =~ line

puts line
