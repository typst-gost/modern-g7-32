#import "../utils.typ": fetch-field, title-owns-city-year

#let arguments(..args, year: auto, city: "Санкт-Петербург") = {
  let args = args.named()
  
  args.organization = args.at("organization", default: "ГУАП")
  args.department = args.at("department", default: "КАФЕДРА №")
  args.position = args.at("position", default: "преподаватель")
  args.documentName = args.at("documentName", default: "ОТЧЁТ О ЛАБОРАТОРНОЙ РАБОТЕ")
  args.group = args.at("group", default: "ГРУППА")
  args.object = args.at("subject", default: "ПРЕДМЕТ")
  args.hasContentNavigationPage = args.at("hasContentNavigationPage", default: false)
  

  let authors = args.at("authors", default: ())
  if type(authors) != array {
    authors = (authors,)
  }
  args.authors = authors
  
  let teachers = args.at("teachers", default: ())
  if type(teachers) != array {
    teachers = (teachers,)
  }
  args.teachers = teachers
  

  args.city = args.at("city", default: city)
  
  // Дата (auto = сегодня, none = пусто)
  if "date" not in args {
    args.date = auto
  }
  
  // Название работы
  args.title = args.at("title", default: "")
  
  return args
}

#let template(
  title: "",
  authors: (),
  teachers: (),
  date: auto,
  organization: "ГУАП",
  department: "КАФЕДРА №",
  position: "преподаватель",
  documentName: "ОТЧЁТ О ЛАБОРАТОРНОЙ РАБОТЕ",
  group: "ГРУППА",
  city: "Санкт-Петербург",
  subject: "ПРЕДМЕТ",
  hasContentNavigationPage: false,
  year: auto,
  ..rest
) = {
  // Определение даты для вывода
  let resolved-date = if date == auto { datetime.today() } else { date }
  let pad2(n) = if n < 10 { "0" + str(n) } else { str(n) }
  let display-date = if resolved-date != none {
    pad2(resolved-date.day()) + "." + pad2(resolved-date.month()) + "." + str(resolved-date.year())
  } else { "" }
  let display-year = if year == auto { resolved-date.year() } else { year }

  title-owns-city-year.update(true)

  // by @Catofood
  set text(font: "Times New Roman", size: 12pt, lang: "ru", hyphenate: false)
  
  align(center, organization)
  v(0.7fr)
  align(center, department)
  v(1fr)
  
  align(left, stack(dir: ltr, "ОТЧЁТ\nЗАЩИЩЁН С ОЦЕНКОЙ\nПРЕПОДАВАТЕЛЬ"))


  
  grid(
    columns: (1.5fr, 1fr, 1.5fr),
    row-gutter: 3pt,
    column-gutter: 10pt,
    align(center, position), 
    "", 
    align(center, teachers.join(", ")),
    line(length: 100%, stroke: 0.5pt), 
    line(length: 100%, stroke: 0.5pt), 
    line(length: 100%, stroke: 0.5pt),
    align(center, text(0.9em, "должность, уч.степень, звание")),
    align(center, text(0.9em, "подпись, дата")),
    align(center, text(0.9em, "инициалы, фамилия")),
  )

  v(1.5fr)
  align(center, text(upper(documentName), size: 1.23em))
  v(0.8fr)
  align(center, stack(
    dir: ttb, 
    text(title, size: 1.2em), 
    v(5pt), 
    align(bottom, line(length: 0%, stroke: 0.5pt)),
  ))
  v(0.8fr)
  align(center)[по курсу:]
  align(center)[#text(subject, size: 1.2em)]
  v(2fr)
  
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 10pt,
    row-gutter: 3pt,
    grid.cell([РАБОТУ ВЫПОЛНИЛ], colspan: 2), 
    text(2.5em, ""), 
    "",
    "СТУДЕНТ гр №", 
    align(center, group), 
    align(right, display-date), 
    align(center, authors.join(", ")),
    line(length: 0%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    line(length: 100%, stroke: 0.5pt),
    grid.cell(text(0.9em, ""), colspan: 2),
    align(center + top, text(0.9em, "подпись, дата")),
    align(center, text(0.9em, "инициалы, фамилия")),
  )
  
  // дефолтный футер слишком низко
  v(2fr)
  align(center)[#city #str(display-year)]

  
  pagebreak()
  
}


