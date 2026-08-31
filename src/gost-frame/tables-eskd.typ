// Основные надписи ЕСКД по ГОСТ 2.104-2006.
// Служебная строка формата высотой 5 мм входит в размер таблицы.

#import "params.typ": *
#import "other.typ": hide-format-borders
#import "gost-params.typ": field, change-value, person-value, inventory-value, copied-by, paper-format

// Основная надпись и дополнительные графы для чертежей и схем (Форма 1)
#let form-1(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  table(
    columns: (7mm, 10mm, 23mm, 15mm, 10mm, 70mm, 5mm, 5mm, 5mm, 5mm, 12mm, 18mm),

    rows: (5mm,)*12,
    align: center + horizon, // Выравнивание таблицы
    stroke: thick-borders, // Толщина границ таблицы

    // Общие поля
    table.cell(x: 5, y: 3, colspan: 1, rowspan: 5)[#field(data, "eskd", 1)],
    table.cell(x: 5, y: 0, colspan: 7, rowspan: 3)[#field(data, "eskd", 2)],
    table.cell(x: 5, y: 8, colspan: 1, rowspan: 3)[#field(data, "eskd", 3)],
    table.cell(x: 6, y: 3, colspan: 3, rowspan: 1)[Лит.],
    table.cell(x: 6, y: 4, colspan: 1, rowspan: 3)[], // Литеры
    table.cell(x: 7, y: 4, colspan: 1, rowspan: 3)[#field(data, "eskd", 4)], // Литеры
    table.cell(x: 8, y: 4, colspan: 1, rowspan: 3)[], // Литеры
    table.cell(x: 9, y: 3, colspan: 2, rowspan: 1)[Масса],
    table.cell(x: 9, y: 4, colspan: 2, rowspan: 3)[#field(data, "eskd", 5)],
    table.cell(x: 11, y: 3, colspan: 1, rowspan: 1)[Масштаб],
    table.cell(x: 11, y: 4, colspan: 1, rowspan: 3)[#field(data, "eskd", 6)],
    table.cell(x: 6, y: 7, colspan: 4, rowspan: 1)[Лист #current-page],
    table.cell(x: 10, y: 7, colspan: 2, rowspan: 1)[Листов #total-pages],
    table.cell(x: 6, y: 8, colspan: 6, rowspan: 3)[#field(data, "eskd", 9)],

    // Секция (33)
    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "index")],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "sheet")],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "document")],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "signature")],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "eskd", "date"))],

    // Должность, ФИО, подпись, дата
    table.cell(x: 0, y: 4, rowspan: 1, colspan: 1, align: left + horizon, inset: 0.1mm)[#scale(x: 80%)[Изм.]],
    table.cell(x: 1, y: 4, rowspan: 1, colspan: 1, align: left + horizon)[Лист],
    table.cell(x: 0, y: 5, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 0, "role", default: [Разраб.])],
    table.cell(x: 0, y: 6, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 1, "role", default: [Пров.])],
    table.cell(x: 0, y: 7, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 2, "role", default: [Т. контр.])],
    table.cell(x: 0, y: 8, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 3, "role")],
    table.cell(x: 0, y: 9, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 4, "role", default: [Н. контр.])],
    table.cell(x: 0, y: 10, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 5, "role", default: [Утв.])],

    table.cell(x: 2, y: 4, rowspan: 1, colspan: 1, align: left + horizon)[№ докум.],
    ..range(0, 6).map(i => table.cell(
      x: 2, y: 5 + i, rowspan: 1, colspan: 1, align: left + horizon,
      [#person-value(data, "eskd", i, "name")]
    )),

    table.cell(x: 3, y: 4, rowspan: 1, colspan: 1, align: left + horizon)[Подп.],
    ..range(0, 6).map(i => table.cell(
      x: 3, y: 5 + i, rowspan: 1, colspan: 1,
      [#person-value(data, "eskd", i, "signature")]
    )),

    table.cell(x: 4, y: 4, rowspan: 1, colspan: 1, align: left + horizon)[Дата],
    ..range(0, 6).map(i => table.cell(
      x: 4, y: 5 + i, rowspan: 1, colspan: 1,
      [#compact-field(person-value(data, "eskd", i, "date"))]
    )),

    // Тонкие границы таблицы
    ..range(1, 1+3).map(n => table.hline(y: n, end: 5, stroke: thin-borders)), // Зона (33)
    ..range(6, 6+5).map(n => table.hline(y: n, end: 5, stroke: thin-borders)), // Фамилии

    // Копировал (31) и Формат (32)
    table.cell(x: 5, y: 11, colspan: 1, rowspan: 1, align: center + horizon)[Копировал #copied-by(data, "eskd")],
    table.cell(x: 6, y: 11, colspan: 6, rowspan: 1, align: right + horizon)[Формат #paper-format(data, "eskd", pagesize)],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(11, 12)
  )
}



// Основная надпись и дополнительные графы для текстовых конструкторских документов (первый или заглавный лист) (Форма 2)
#let form-2(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  table(
    columns: (7mm, 10mm, 23mm, 15mm, 10mm, 70mm, 15mm, 15mm, 20mm),
    rows: (5mm,) * 9,
    align: center + horizon,
    stroke: thick-borders,

    // Общие поля
    table.cell(x: 6, y: 5, rowspan: 3, colspan: 3)[#field(data, "eskd", 9)],
    table.cell(x: 5, y: 0, rowspan: 3, colspan: 4)[#field(data, "eskd", 2)],
    table.cell(x: 5, y: 3, rowspan: 5, colspan: 1)[#field(data, "eskd", 1)],

    // Дополнительные поля
    table.cell(x: 0, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "index")],
    table.cell(x: 1, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "sheet")],
    table.cell(x: 2, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "document")],
    table.cell(x: 3, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "signature")],
    table.cell(x: 4, y: 1, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "eskd", "date"))],

    // Должность, ФИО, подпись, дата
    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1, align: left + horizon, inset: 0.1mm)[#scale(x: 80%)[Изм.]],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Лист],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[№ докум.],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Подп.],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Дата],

    table.cell(x: 0, y: 3, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 0, "role", default: [Разраб.])],
    table.cell(x: 0, y: 4, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 1, "role", default: [Пров.])],
    table.cell(x: 0, y: 5, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 2, "role")],
    table.cell(x: 0, y: 6, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 3, "role", default: [Н.контр.])],
    table.cell(x: 0, y: 7, rowspan: 1, colspan: 2, align: left + horizon)[#person-value(data, "eskd", 4, "role", default: [Утв.])],

    ..range(0, 5).map(i => table.cell(
      x: 2, y: 3 + i, rowspan: 1, colspan: 1, align: left + horizon,
      [#person-value(data, "eskd", i, "name")]
    )),

    ..range(0, 5).map(i => table.cell(
      x: 3, y: 3 + i, rowspan: 1, colspan: 1,
      [#person-value(data, "eskd", i, "signature")]
    )),

    ..range(0, 5).map(i => table.cell(
      x: 4, y: 3 + i, rowspan: 1, colspan: 1,
      [#compact-field(person-value(data, "eskd", i, "date"))]
    )),

    // Литера, лист, листов
    table.cell(x: 6, y: 3, rowspan: 1, colspan: 1, align: center + horizon)[Лит.],
    table.cell(x: 6, y: 4, rowspan: 1, colspan: 1, align: center + horizon)[#field(data, "eskd", 4)],
    table.cell(x: 7, y: 3, rowspan: 1, colspan: 1, align: center + horizon)[Лист],
    table.cell(x: 7, y: 4, rowspan: 1, colspan: 1, align: center + horizon)[#current-page],
    table.cell(x: 8, y: 3, rowspan: 1, colspan: 1, align: center + horizon)[Листов],
    table.cell(x: 8, y: 4, rowspan: 1, colspan: 1, align: center + horizon)[#total-pages],

    // Тонкие границы таблицы
    table.hline(y: 1, end: 5, stroke: thin-borders), // Вторая линия
    ..range(4, 8).map(n => table.hline(y: n, end: 5, stroke: thin-borders)), // Фамилии

    // Копировал (31) и Формат (32)
    table.cell(x: 5, y: 8)[Копировал #copied-by(data, "eskd")],
    table.cell(x: 6, y: 8, rowspan: 1, colspan: 3, align: right + horizon)[Формат #paper-format(data, "eskd", pagesize)],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(8, 9)
  )
}



// Основная надпись и дополнительные графы для чертежей (схем) и текстовых конструкторских документов (последующие листы) (Форма 2а)
#let form-2a(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  table(
    columns: (7mm, 10mm, 23mm, 15mm, 10mm, 110mm, 10mm),
    rows: (5mm, ) * 4,
    align: center + horizon,
    stroke: thick-borders,

    // Общие поля
    table.cell(x: 5, y: 0, rowspan: 3, colspan: 1)[#field(data, "eskd", 2)], // Обозначение документа

    // Изм., Лист, №Документа, Подп., Дата
    table.cell(x: 0, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "index")],
    table.cell(x: 1, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "sheet")],
    table.cell(x: 2, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "document")],
    table.cell(x: 3, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "signature")],
    table.cell(x: 4, y: 1, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "eskd", "date"))],

    table.cell(x: 0, y: 2, rowspan: 1, colspan: 1, align: left + horizon, inset: 0.1mm)[#scale(x: 80%)[Изм.]],
    table.cell(x: 1, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Лист],
    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[№ докум.],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Подп.],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Дата],

    // Лист
    table.cell(x: 6, y: 0, rowspan: 3, colspan: 1, inset: 0mm)[
      #table(
        columns: (10mm),
        rows: (7mm, 8mm),

        // Лист
        [Лист],
        [#current-page]
      )
    ],

    // Тонкие границы таблицы
    table.hline(y: 1, end: 5, stroke: thin-borders), // Вторая линия

    // Копировал (31) и Формат (32)
    table.cell(x: 5, y: 3)[
      #place(
        left + horizon,
        dx: 5mm,
        [Копировал #copied-by(data, "eskd")]
      )
      #place(
        right + horizon,
        dx: 0mm,
        [Формат #paper-format(data, "eskd", pagesize)]
      )
    ],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(3, 7)
  )
}



// Основная надпись и дополнительные графы для текстовых конструкторских документов при двустороннем светокопировании (последующие листы) (Форма 2б)
#let form-2b(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  table(
    columns: (10mm, 110mm, 7mm, 10mm, 23mm, 15mm, 10mm),
    rows: (5mm, ) * 4,
    align: center + horizon,
    stroke: thick-borders,

    // Лист
    table.cell(x: 0, y: 0, rowspan: 3, colspan: 1, inset: 0mm)[
      #table(
        columns: (10mm),
        rows: (7mm, 8mm),

        [Лист], [#current-page]
      )
    ],

    // Общие поля
    table.cell(x: 1, y: 0, rowspan: 3, colspan: 1)[#field(data, "eskd", 2)], // Обозначение документа

    // Изм., Лист, №Документа, Подп., Дата
    table.cell(x: 2, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "index")],
    table.cell(x: 3, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "sheet")],
    table.cell(x: 4, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "document")],
    table.cell(x: 5, y: 1, rowspan: 1, colspan: 1)[#change-value(data, "eskd", "signature")],
    table.cell(x: 6, y: 1, rowspan: 1, colspan: 1)[#compact-field(change-value(data, "eskd", "date"))],

    table.cell(x: 2, y: 2, rowspan: 1, colspan: 1, align: left + horizon, inset: 0.1mm)[#scale(x: 80%)[Изм.]],
    table.cell(x: 3, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Лист],
    table.cell(x: 4, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[№ докум.],
    table.cell(x: 5, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Подп.],
    table.cell(x: 6, y: 2, rowspan: 1, colspan: 1, align: left + horizon)[Дата],

    // Тонкие границы таблицы
    table.hline(y: 1, end: 7, stroke: thin-borders), // Вторая линия

    // Копировал (31) и Формат (32)
    table.cell(x: 1, y: 3, rowspan: 1, colspan: 6)[
      #place(
        center + horizon,
        dx: 5mm,
        [Копировал #copied-by(data, "eskd")]
      )
      #place(
        right + horizon,
        dx: 0mm,
        [Формат #paper-format(data, "eskd", pagesize)]
      )
    ],

    // Скрытие границ нижнего ряда
    ..hide-format-borders(3, 7)
  )
}



// === Дополнительные графы ===

// Дополнительные графы (3 колонки)
#let eskd-AG-3(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  rotate(-90deg, reflow: true,
    table(
      columns: (25mm, 35mm, 25mm),
      rows: (5mm, 7mm),
      align: center + horizon,
      stroke: thick-borders,

      [Инв. № подл.], [Подп. и дата], [Взам. инв. №],
      [#inventory-value(data, "eskd", 19)],
      [#inventory-value(data, "eskd", 20)],
      [#inventory-value(data, "eskd", 21)]

    )
  )
}


// Дополнительные графы (5 колонок)
#let eskd-AG-5(data: (:)) = {
  show table.cell: set text(size: table-text-size, hyphenate: false)

  rotate( -90deg, reflow: true,
    table(
      columns: (25mm, 35mm, 25mm, 25mm, 35mm),
      rows: (5mm, 7mm),
      align: center + horizon,
      stroke: thick-borders,

      [Инв. № подл.], [Подп. и дата], [Взам. инв. №], [Инв. № дубл.], [Подп. и дата],
      [#inventory-value(data, "eskd", 19)],
      [#inventory-value(data, "eskd", 20)],
      [#inventory-value(data, "eskd", 21)],
      [#inventory-value(data, "eskd", 22)],
      [#inventory-value(data, "eskd", 23)],

    )
  )
}
