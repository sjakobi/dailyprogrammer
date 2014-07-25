from strutils import join, parseHexInt, replace, split, toBin

proc hexToXs(hexStr: string): string =
  hexStr.parseHexInt.toBin(8).replace('1', 'x').replace('0', ' ')

proc hexsToBitmap(hexVals: string): string =
  hexVals.split.map(hexToXs).join("\n")

if isMainModule:
  for line in stdin.lines():
    echo(hexsToBitmap(line), "\n")
