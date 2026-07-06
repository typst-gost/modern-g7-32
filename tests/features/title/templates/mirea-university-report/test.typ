#import "/src/export.typ": gost, title-templates

#show: gost.with(
  title-template: title-templates.at("mirea-university-report"),
  institute: (
    name: "Институт кибербезопасности и цифровых технологий",
  ),
  department: (
    name: "Кафедра КБ-1 «Защита информации»",
  ),
  report-number: 3,
  discipline: "Организационное и правовое обеспечение информационной безопасности",
  group: "ИКБО-01-20",
  student-name: "Иванов И.И.",
  reviewer-name: "Петров П.П.",
  reviewer-position: "Преподаватель кафедры КБ-1",
  city: "Москва",
)

= Введение
Проверка встроенного шаблона титульного листа РТУ МИРЭА.

= Основная часть
#lorem(60)
