// Отступ рамки от края листа
#let frame-margin = (
  left: 20mm,
  right: 5mm,
  top: 5mm,
  bottom: 10mm
)
// Отступы от внутренних краёв рамки
#let inside-frame-margin = (
  left: 10mm,
  right: 10mm,
  top: 10mm,
  bottom: 5mm
)

// Параметры таблиц
#let thick-borders = 0.7mm // Толстые линии
#let thin-borders = 0.3mm // Тонкие линии
#let table-text-size = 10pt // Размер шрифта в таблицах
#let compact-field-text-size = 7pt // Даты и другие значения в графах шириной 10 мм
#let format-row-height = 5mm // Служебная строка «Формат» под основной надписью
#let page-number-size = (width: 16mm, height: 8mm)

#let compact-field(body) = text(size: compact-field-text-size, body)

// Нумерация учитывает явные обновления `counter(page)`.
#let total-pages = {context counter(page).final().first()}
#let current-page = {context counter(page).get().first()}

#import "page-sizes.typ": pagesize // Динамическая функция размера страницы
