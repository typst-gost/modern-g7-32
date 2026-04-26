#import "/src/export.typ": gost

#show: gost.with(
  university: "mirea",
  institute: (
    name: "Институт кибербезопасности и цифровых технологий",
  ),
  department: (
    name: "Кафедра КБ-1 «Защита информации»",
  ),
  report-number: 1,
  discipline: "Организационное и правовое обеспечение информационной безопасности",
  group: "ИКБО-01-20",
  student-name: "Иванов И.И.",
  reviewer-name: "Петров П.П.",
  reviewer-position: "Преподаватель кафедры КБ-1",
  city: "Москва",
)

= Проверка профиля
#lorem(90)

#table(
  columns: 3,
  table.header([Параметр], [Значение], [Примечание]),
  [university], [mirea], [Включён MIREA-профиль],
  [group], [БАСО-03-21], [Передано в титульный лист],
)

#lorem(70)
