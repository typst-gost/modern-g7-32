// Основные и производные форматы по ГОСТ 2.301-68.

#let page-sizes = (
  // Сторона 1, сторона 2, обозначение
  (841,   1189,   "A0"),
  (1189, 1682,   "A0x2"),
  (1189, 2523,   "A0x3"),
  (594,   841,     "A1"),
  (841,   1783,   "A1x3"),
  (841,   2378,   "A1x4"),
  (420,   594,     "A2"),
  (594,   1261,   "A2x3"),
  (594,   1682,   "A2x4"),
  (594,   2102,   "A2x5"),
  (297,   420,     "A3"),
  (420,   891,     "A3x3"),
  (420,   1189,   "A3x4"),
  (420,   1468,   "A3x5"),
  (420,   1783,   "A3x6"),
  (420,   2080,   "A3x7"),
  (210,   297,     "A4"),
  (297,   630,     "A4x3"),
  (297,   841,     "A4x4"),
  (297,   1051,   "A4x5"),
  (297,   1261,   "A4x6"),
  (297,   1471,   "A4x7"),
  (297,   1682,   "A4x8"),
  (297,   1892,   "A4x9")
)

#let page-size-tolerance = 0.01

// Сопоставляет числовые размеры в миллиметрах с обозначением формата.
#let page-size-name(width, height) = {
  let close(a, b) = calc.abs(a - b) <= page-size-tolerance
  let found = page-sizes.find(e => {
    let (side-a, side-b, name) = e
    (
      (close(width, side-a) and close(height, side-b)) or
      (close(width, side-b) and close(height, side-a))
    )
  })

  if found != none { found.at(2) } else { [#width × #height мм] }
}

#let pagesize = context page-size-name(page.width.mm(), page.height.mm())
