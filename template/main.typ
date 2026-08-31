#import "@preview/modern-g7-32:0.3.0": abstract, frame-forms, gost
#import "document-data.typ": document-data

#show: gost.with(
  ministry: "Наименование министерства",
  organization: (
    full: "Наименование организации",
    short: "Сокращённое наименование организации",
  ),
  udk: "индекс УДК",
  research-number: "регистрационный номер НИР",
  report-number: "регистрационный номер отчета",
  approved-by: (
    name: "Фамилия И.О.",
    position: "Должность, сокращ. наимен. орг",
  ),
  agreed-by: (
    name: "Фамилия И.О.",
    position: "Должность, сокращ. наимен. орг",
  ),
  about: "О научно-исследовательской работе",
  subject: "Наименование отчёта",
  manager: (name: "Фамилия И.О.", position: "Должность"),
  city: "Город",
  performers: (
    (name: "И.О. Фамилия", position: "Должность"),
    (name: "И.О. Фамилия", position: "Должность"),
  ),
  // Удалите параметр frame, если рамки и основные надписи не нужны.
  frame: (
    form-start: frame-forms.spds.form-3,
    additional-start: frame-forms.spds.ag-7,
    form-other: frame-forms.spds.form-6,
    additional-other: frame-forms.spds.ag-3,
    data: document-data,
  ),
)

#abstract("шаблон", "документ", "типография")[
  Текст реферата
]

#outline()

= Введение
Текст введения

= Основная часть
...
