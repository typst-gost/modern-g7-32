// Основные надписи СПДС по ГОСТ Р 21.1101-2013.
// Служебная строка формата высотой 5 мм входит в размер таблицы.

#import "params.typ": *
#import "other.typ": hide-format-borders
#import "gost-params.typ": field, change-value, person-value, inventory-value, approval-value, paper-format

// Для листов основных комплектов рабочих чертежей, графических документов проектной документации и графических документов по инженерным изысканиям (Форма 3)
#let form-3(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)
  let default-roles = ([Разраб.], [], [], [], [Н.контр.], [])

  table(
    columns: (10mm, 10mm, 10mm, 10mm, 15mm, 10mm, 70mm, 15mm, 15mm, 20mm),

    rows: (5mm,)*12,
    align: center + horizon, // Выравнивание таблицы
    stroke: thick-borders, // Толщина границ таблицы

    // Общие поля
    table.cell(x: 6, y: 0, colspan: 4, rowspan: 2)[#field(data, "spds", 1)],
    table.cell(x: 6, y: 2, colspan: 4, rowspan: 3)[#field(data, "spds", 2)],
    table.cell(x: 6, y: 5, colspan: 1, rowspan: 3)[#field(data, "spds", 3)],
    table.cell(x: 6, y: 8, colspan: 1, rowspan: 3)[#field(data, "spds", 4)],
    table.cell(x: 7, y: 8, colspan: 3, rowspan: 3)[#field(data, "spds", 9)],

    table.cell(x: 7, y: 5, colspan: 1, rowspan: 1)[Стадия],
    table.cell(x: 7, y: 6, colspan: 1, rowspan: 2)[#field(data, "spds", 6)],
    table.cell(x: 8, y: 5, colspan: 1, rowspan: 1)[Лист],
    table.cell(x: 8, y: 6, colspan: 1, rowspan: 2)[#current-page],
    table.cell(x: 9, y: 5, colspan: 1, rowspan: 1)[Листов],
    table.cell(x: 9, y: 6, colspan: 1, rowspan: 2)[#total-pages],

    // Дополнительное
    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "index")],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sections")],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sheet")],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "document")],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "signature")],
    table.cell(x: 5, y: 2, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "spds", "date"))],

    // Должность, ФИО, Подпись, Дата
    table.cell(x: 0, y: 4, rowspan: 1, colspan: 1)[Изм.],
    table.cell(x: 1, y: 4, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[Кол.уч.]],
    table.cell(x: 2, y: 4, rowspan: 1, colspan: 1)[Лист],
    table.cell(x: 3, y: 4, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[№док.]],
    table.cell(x: 4, y: 4, rowspan: 1, colspan: 1)[Подп.],
    table.cell(x: 5, y: 4, rowspan: 1, colspan: 1)[Дата],

    ..range(0, 6).map(i => table.cell(
      x: 0, y: 5 + i, rowspan: 1, colspan: 2,
      [#person-value(data, "spds", i, "role", default: default-roles.at(i))]
    )),
    ..range(0, 6).map(i => table.cell(
      x: 2, y: 5 + i, rowspan: 1, colspan: 2,
      [#person-value(data, "spds", i, "name")]
    )),
    ..range(0, 6).map(i => table.cell(
      x: 4, y: 5 + i, rowspan: 1, colspan: 1,
      [#person-value(data, "spds", i, "signature")]
    )),
    ..range(0, 6).map(i => table.cell(
      x: 5, y: 5 + i, rowspan: 1, colspan: 1,
      [#compact-field(person-value(data, "spds", i, "date"))]
    )),

    // Тонкие границы таблицы
    ..range(1, 4).map(n => table.hline(y: n, end: 6, stroke: thin-borders)),
    ..range(6, 11).map(n => table.hline(y: n, end: 6, stroke: thin-borders)), // Фамилии

    // Формат (26)
    table.cell(x: 7, y: 11, rowspan: 1, colspan: 3, align: left + horizon)[Формат #paper-format(data, "spds", pagesize)],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(11, 10)
  )
}



// Для чертежей строительных изделий (первый лист) (Форма 4)
#let form-4(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)
  let default-roles = ([Разраб.], [], [], [], [Н.контр.], [])

  table(
    columns: (10mm, 10mm, 10mm, 10mm, 15mm, 10mm, 70mm, 15mm, 15mm, 20mm),

    rows: (5mm,)*12,
    align: center + horizon, // Выравнивание таблицы
    stroke: thick-borders, // Толщина границ таблицы

    // Общие поля
    table.cell(x: 6, y: 0, rowspan: 3, colspan: 4)[#field(data, "spds", 1)],
    table.cell(x: 6, y: 3, rowspan: 5, colspan: 1)[#field(data, "spds", 5)],
    table.cell(x: 6, y: 8, rowspan: 3, colspan: 1)[#field(data, "spds", 23)],
    table.cell(x: 7, y: 8, rowspan: 3, colspan: 3)[#field(data, "spds", 9)],
    table.cell(x: 7, y: 7, rowspan: 1, colspan: 3, inset: 0mm)[
      #table(
        columns: (20mm, 30mm),
        rows: (5mm),
        stroke: thick-borders, // Толщина границ таблицы

        [Лист #current-page], [Листов #total-pages]
      )
    ],

    table.cell(x: 7, y: 3, rowspan: 1, colspan: 1)[Стадия],
    table.cell(x: 7, y: 4, rowspan: 3, colspan: 1)[#field(data, "spds", 6)],
    table.cell(x: 8, y: 3, rowspan: 1, colspan: 1)[Масса],
    table.cell(x: 8, y: 4, rowspan: 3, colspan: 1)[#field(data, "spds", 24)],
    table.cell(x: 9, y: 3, rowspan: 1, colspan: 1)[Масштаб],
    table.cell(x: 9, y: 4, rowspan: 3, colspan: 1)[#field(data, "spds", 25)],

    // Дополнительное
    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "index")],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sections")],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sheet")],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "document")],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "spds", "signature")],
    table.cell(x: 5, y: 2, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "spds", "date"))],

    // Должность, ФИО, Подпись, Дата
    table.cell(x: 0, y: 4, rowspan: 1, colspan: 1)[Изм.],
    table.cell(x: 1, y: 4, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[Кол.уч.]],
    table.cell(x: 2, y: 4, rowspan: 1, colspan: 1)[Лист],
    table.cell(x: 3, y: 4, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[№док.]],
    table.cell(x: 4, y: 4, rowspan: 1, colspan: 1)[Подп.],
    table.cell(x: 5, y: 4, rowspan: 1, colspan: 1)[Дата],

    ..range(0, 6).map(i => table.cell(
      x: 0, y: 5 + i, rowspan: 1, colspan: 2,
      [#person-value(data, "spds", i, "role", default: default-roles.at(i))]
    )),
    ..range(0, 6).map(i => table.cell(
      x: 2, y: 5 + i, rowspan: 1, colspan: 2,
      [#person-value(data, "spds", i, "name")]
    )),
    ..range(0, 6).map(i => table.cell(
      x: 4, y: 5 + i, rowspan: 1, colspan: 1,
      [#person-value(data, "spds", i, "signature")]
    )),
    ..range(0, 6).map(i => table.cell(
      x: 5, y: 5 + i, rowspan: 1, colspan: 1,
      [#compact-field(person-value(data, "spds", i, "date"))]
    )),

    // Тонкие границы таблицы
    ..range(1, 4).map(n => table.hline(y: n, end: 6, stroke: thin-borders)),
    ..range(6, 11).map(n => table.hline(y: n, end: 6, stroke: thin-borders)), // Фамилии

    // Формат (26)
    table.cell(x: 7, y: 11, rowspan: 1, colspan: 3, align: left + horizon)[Формат #paper-format(data, "spds", pagesize)],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(11, 10)

  )
}



// Для эскизных чертежей общих видов нетиповых изделий, всех видов текстовых документов (первый или заглавный лист) (форма 5)
#let form-5(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)
  let default-roles = ([Разраб.], [], [], [Н.контр.], [])

  table(
    columns: (10mm, 10mm, 10mm, 10mm, 15mm, 10mm, 70mm, 15mm, 15mm, 20mm),
    rows: (5mm,)*9,
    align: center + horizon, // Выравнивание таблицы
    stroke: thick-borders, // Толщина границ таблицы

    // Общие поля
    table.cell(x: 6, y: 0, rowspan: 3, colspan: 4)[#field(data, "spds", 1)],
    table.cell(x: 6, y: 3, rowspan: 5, colspan: 1)[#field(data, "spds", 5)],
    table.cell(x: 7, y: 5, rowspan: 3, colspan: 3)[#field(data, "spds", 23)],


    table.cell(x: 7, y: 3, rowspan: 1, colspan: 1)[Стадия],
    table.cell(x: 7, y: 4, rowspan: 1, colspan: 1)[#field(data, "spds", 6)],
    table.cell(x: 8, y: 3, rowspan: 1, colspan: 1)[Лист],
    table.cell(x: 8, y: 4, rowspan: 1, colspan: 1)[#current-page],
    table.cell(x: 9, y: 3, rowspan: 1, colspan: 1)[Листов],
    table.cell(x: 9, y: 4, rowspan: 1, colspan: 1)[#total-pages],

    // Дополнительное
    table.cell(x: 0, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "index")],
    table.cell(x: 1, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sections")],
    table.cell(x: 2, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sheet")],
    table.cell(x: 3, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "document")],
    table.cell(x: 4, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "signature")],
    table.cell(x: 5, y: 1, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "spds", "date"))],

    // Должность, ФИО, Подпись, Дата
    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1)[Изм.],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[Кол.уч.]],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1)[Лист],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[№док.]],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1)[Подп.],
    table.cell(x: 5, y: 2, rowspan: 1, colspan: 1)[Дата],

    ..range(0, 5).map(i => table.cell(
      x: 0, y: 3 + i, rowspan: 1, colspan: 2,
      [#person-value(data, "spds", i, "role", default: default-roles.at(i))]
    )),
    ..range(0, 5).map(i => table.cell(
      x: 2, y: 3 + i, rowspan: 1, colspan: 2,
      [#person-value(data, "spds", i, "name")]
    )),
    ..range(0, 5).map(i => table.cell(
      x: 4, y: 3 + i, rowspan: 1, colspan: 1,
      [#person-value(data, "spds", i, "signature")]
    )),
    ..range(0, 5).map(i => table.cell(
      x: 5, y: 3 + i, rowspan: 1, colspan: 1,
      [#compact-field(person-value(data, "spds", i, "date"))]
    )),

    // Тонкие границы таблицы
    ..range(1, 2).map(n => table.hline(y: n, end: 6, stroke: thin-borders)),
    ..range(4, 8).map(n => table.hline(y: n, end: 6, stroke: thin-borders)), // Фамилии

    // Формат листа (26)
    table.cell(x: 7, y: 8, rowspan: 1, colspan: 3, align: left + horizon)[Формат #paper-format(data, "spds", pagesize)],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(8, 10)
  )
}



// Для чертежей строительных изделий, эскизных чертежей общих видов нетиповых изделий и всех видов текстовых документов (последующие листы) (форма 6)
#let form-6(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  table(
    columns: (10mm, 10mm, 10mm, 10mm, 15mm, 10mm, 110mm, 10mm),
    rows: (5mm,) * 4,
    align: center + horizon, // Выравнивание таблицы
    stroke: thick-borders, // Толщина границ таблицы

    // Общие поля
    table.cell(x: 6, y: 0, rowspan: 3, colspan: 1)[#field(data, "spds", 1)],

    // Лист
    table.cell(x: 7, y: 0, rowspan: 3, colspan: 1, inset: 0mm)[
      #table(
        columns: 10mm,
        rows: (7mm, 8mm),

        stroke: thick-borders, // Толщина границ таблицы

        [Лист],
        [#current-page]
      )
    ],

    // Дополнительное
    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1)[Изм.],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[Кол.уч.]],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1)[Лист],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1, inset: 0.1mm)[#scale(x: 80%)[№док.]],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1)[Подп.],
    table.cell(x: 5, y: 2, rowspan: 1, colspan: 1)[Дата],

    table.cell(x: 0, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "index")],
    table.cell(x: 1, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sections")],
    table.cell(x: 2, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "sheet")],
    table.cell(x: 3, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "document")],
    table.cell(x: 4, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "spds", "signature")],
    table.cell(x: 5, y: 1, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "spds", "date"))],

    // Тонкие границы таблицы
    ..range(1, 2).map(n => table.hline(y: n, end: 6, stroke: thin-borders)), // Фамилии

    // Формат листа (26)
    table.cell(x: 6, y: 3, rowspan: 1, colspan: 2, align: right + horizon)[
      #box(width: 50mm)[Формат #paper-format(data, "spds", pagesize)]
    ],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(3, 8)
  )
}



// === Дополнительные графы ===

// Дополнительные графы (короткая)
#let spds-AG-3(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  rotate( -90deg, reflow: true,
    table(
      columns: (25mm, 35mm, 25mm),
      rows: (5mm, 7mm),
      align: center + horizon, // Выравнивание таблицы
      stroke: thick-borders, // Толщина границ таблицы

      [Инв. № подл.], [Подп. и дата], [Взам. инв. №],
      [#inventory-value(data, "spds", 20)],
      [#inventory-value(data, "spds", 21)],
      [#inventory-value(data, "spds", 22)]
    )
  )
}

// Дополнительные графы (длинная)
#let spds-AG-7(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  // Typst 0.15.1 не размещает две reflow-таблицы рядом в footer.
  rotate(-90deg, reflow: true,
    table(
      columns: (25mm, 35mm, 25mm, 20mm, 20mm, 15mm, 10mm),
      rows: (3mm, 2mm, 3mm, 2mm, 5mm),
      align: center + horizon,
      stroke: thick-borders,

      table.cell(x: 3, y: 0, rowspan: 2, colspan: 4, align: left + horizon)[Согласовано],
      table.cell(x: 3, y: 2, rowspan: 2)[#approval-value(data, "spds", 10)],
      table.cell(x: 4, y: 2, rowspan: 2)[#approval-value(data, "spds", 11)],
      table.cell(x: 5, y: 2, rowspan: 2)[#approval-value(data, "spds", 12)],
      table.cell(x: 6, y: 2, rowspan: 2)[#compact-field(approval-value(data, "spds", 13))],
      table.cell(x: 3, y: 4)[],
      table.cell(x: 4, y: 4)[],
      table.cell(x: 5, y: 4)[],
      table.cell(x: 6, y: 4)[],

      table.cell(x: 0, y: 1, rowspan: 2)[Инв. № подл.],
      table.cell(x: 1, y: 1, rowspan: 2)[Подп. и дата],
      table.cell(x: 2, y: 1, rowspan: 2)[Взам. инв. №],
      table.cell(x: 0, y: 3, rowspan: 2)[#inventory-value(data, "spds", 20)],
      table.cell(x: 1, y: 3, rowspan: 2)[#inventory-value(data, "spds", 21)],
      table.cell(x: 2, y: 3, rowspan: 2)[#inventory-value(data, "spds", 22)],

      table.hline(y: 0, end: 3, stroke: 0pt),
      ..range(0, 3).map(n => table.vline(x: n, end: 1, stroke: 0pt)),
    )
  )
}
