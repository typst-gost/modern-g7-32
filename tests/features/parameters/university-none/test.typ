#import "/src/export.typ": gost

#show: gost.with(
  university: none,
  ministry: "Министерство науки и высшего образования Российской Федерации",
  organization: (
    full: "Национальный исследовательский университет",
    short: "НИУ",
  ),
  about: "О научно-исследовательской работе",
  subject: "Проверка базового профиля",
  manager: (name: "Фамилия И.О.", position: "Преподаватель"),
  city: "Москва",
)

= Проверка базового режима
#lorem(90)

#table(
  columns: 2,
  table.header([Поле], [Значение]),
  [university], [none],
  [subject], [Проверка базового профиля],
)

#lorem(70)
