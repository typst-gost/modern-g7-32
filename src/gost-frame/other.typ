#import "params.typ": *

#let frame = {

  // Размер рамки равен размеру листа за вычетом внешних полей.

  place(
    top + left,
    dx: frame-margin.left,
    dy: frame-margin.top,
    rect(
      // Правый и нижний края остаются на заданных внешних полях.
      stroke: thick-borders,
      width: 100% - frame-margin.right - frame-margin.left,
      height: 100% - frame-margin.bottom - frame-margin.top
    )
  )
}

#let page-number = rect(
  width: page-number-size.width,
  height: page-number-size.height,
  stroke: 0.5mm,
  place(center + horizon, current-page),
)

// Скрывает внешние границы служебной строки, сохраняя её высоту.
#let hide-format-borders(row, cols) = (
  table.hline(y: row + 1, stroke: 0pt),
  ..range(0, cols + 1).map(n => table.vline(start: row, x: n, stroke: 0pt))
)
