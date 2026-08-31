#import "/src/export.typ": (
  form-data,
  frame-forms,
  gost-frame,
  person,
  stamp-data,
)

#let data = stamp-data(
  eskd: form-data(
    fields: (
      "1": [Кронштейн],
      "2": [АБВГ.745321.001],
      "3": [Сталь 20 ГОСТ 1050—2013],
      "4": [О],
      "5": [0,42],
      "6": [1:1],
      "9": [ООО «Проект»],
    ),
    people: (
      person(role: [Разраб.], name: [Иванов], date: [12.08.26]),
      person(role: [Пров.], name: [Петров], date: [12.08.26]),
    ),
  ),
)

#set page(paper: "a4")
#set text(size: 11pt, lang: "ru")

#show: gost-frame.with(
  form-start: frame-forms.eskd.form-1,
  additional-start: frame-forms.eskd.ag-5,
  form-other: frame-forms.eskd.form-2a,
  additional-other: frame-forms.eskd.ag-3,
  data: data,
)

= Первый лист ЕСКД

#lorem(80)

#pagebreak()

= Последующий лист ЕСКД

#lorem(80)
