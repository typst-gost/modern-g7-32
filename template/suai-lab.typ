#import "@local/modern-g7-32:0.2.0": abstract, gost, title-templates, appendixes



#show: gost.with(
  title-template: title-templates.suai-university-lab,
  organization: "ГУАП",
  department: "КАФЕДРА №14",
  group: "1346",
  subject: "Базы данных",
  title: "Лабораторнаяя работа 1",
  authors: ("И.И. Иванвов",),
  teachers: ("П.П. Петров",),
  position: "доцент, канд. тех. наук",
  city: "Санкт-Петербург",
  date: auto,


)

#abstract("шаблон", "документ", "типография")[
  Текст реферата
]

#outline()

= Введение
Текст введения

= Основная часть
...
