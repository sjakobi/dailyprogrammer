import strutils

type BitMap = seq[string]

proc hexToXs(hexStr: string): string =
  hexStr.parseHexInt.toBin(8).replace('1', 'x').replace('0', ' ')

proc fromHexVals(hexVals: string): BitMap =
  hexVals.split.map(hexToXs)

proc zoomIn2x(bm: BitMap): BitMap =
  result = newSeq[string](bm.len() * 2)
  for i, row in bm:
    var zRow = newString(row.len() * 2)
    for j, c in row:
      zRow[2*j] = c
      zRow[2*j + 1] = c
    result[2*i] = zRow
    result[2*i + 1] = zRow

proc zoomOut2x(bm: BitMap): BitMap =
  result = newSeq[string](bm.len() div 2)
  for i in 0..bm.len() div 2 - 1:
    result[i] = newString(bm[i*2].len() div 2)
    for j in 0..bm[i*2].len() div 2 - 1:
      result[i][j] = bm[i*2][j*2]

proc rotate90(bm: BitMap): BitMap =
  result = newSeq[string](bm.len())
  for j in 0..high(bm[0]):
    result[j] = newString(
    for i in 0..high(bm):


proc `$`(bm: BitMap): string =
  bm.join("\n")

if isMainModule:
  for line in stdin.lines():
    echo(fromHexVals(line).zoomIn2x.zoomOut2x, "\n")
