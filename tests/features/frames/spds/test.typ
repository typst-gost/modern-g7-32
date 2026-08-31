#import "/src/export.typ": (
  form-data,
  frame-forms,
  gost,
  person,
  stamp-data,
)

#let data = stamp-data(
  spds: form-data(
    fields: (
      "1": [АБВГ.2026-АР],
      "2": [Жилой комплекс «Северный»],
      "3": [Административное здание],
      "4": [План первого этажа],
      "5": [Архитектурные решения],
      "6": [Р],
      "9": [ООО «Проект»],
      "25": [1:100],
    ),
    people: (
      person(role: [Разраб.], name: [Иванов], date: [12.08.26]),
      person(role: [ГИП], name: [Петров], date: [12.08.26]),
      person(role: [Пров.], name: [Сидоров], date: [12.08.26]),
    ),
  ),
)

#show: gost.with(
  ministry: "Наименование министерства",
  organization: (
    full: "Наименование организации",
    short: "Сокращённое наименование организации",
  ),
  subject: "Проверка интеграции основной надписи",
  city: "Москва",
  year: 2026,
  frame: (
    form-start: frame-forms.spds.form-3,
    additional-start: frame-forms.spds.ag-7,
    form-other: frame-forms.spds.form-6,
    additional-other: frame-forms.spds.ag-3,
    data: data,
  ),
)

= Первый оформляемый лист

#lorem(80)

#pagebreak()

= Последующий оформляемый лист

#lorem(80)
