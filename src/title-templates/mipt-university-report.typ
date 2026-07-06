// Титульный лист отчёта о лабораторной работе МФТИ.
// Канон — сложившийся студенческий формат Физтеха: без строки министерства,
// без линий для подписей и дат; номер работы без «№»; город — Долгопрудный.

#import "../utils.typ": fetch-field

#let arguments(..args, year: auto) = {
  let args = args.named()

  args.organization = fetch-field(
    args.at("organization", default: none),
    ("name", "status"),
    default: (
      name: "Московский физико-технический институт",
      status: "(национальный исследовательский университет)",
    ),
    hint: "организации",
  )
  args.school = args.at("school", default: none)
  args.report-type = args.at(
    "report-type",
    default: "Отчёт о выполнении лабораторной работы",
  )
  args.report-number = args.at("report-number", default: none)
  args.subject = args.at("subject", default: none)
  args.group = args.at("group", default: none)
  args.student-name = args.at("student-name", default: none)
  args.instructor-label = args.at("instructor-label", default: "Преподаватель")
  args.instructor-name = args.at("instructor-name", default: none)

  args
}

#let present-lines(..items) = {
  items.pos().filter(line => line != none).join(linebreak())
}

#let report-heading(report-type, report-number) = {
  if report-number == none {
    [#report-type]
  } else {
    [#report-type #report-number]
  }
}

#let students-block(student-name, group) = {
  let students = if type(student-name) == array {
    student-name
  } else {
    (student-name,)
  }
  let plural = students.len() > 1

  present-lines(
    if plural [Работу выполнили:] else [Работу выполнил:],
    if group != none {
      if plural [Студенты группы #group] else [Студент группы #group]
    },
    ..students,
  )
}

#let template(
  organization: (
    name: "Московский физико-технический институт",
    status: "(национальный исследовательский университет)",
  ),
  school: none,
  report-type: "Отчёт о выполнении лабораторной работы",
  report-number: none,
  subject: none,
  group: none,
  student-name: none,
  instructor-label: "Преподаватель",
  instructor-name: none,
) = [
  #set text(font: "Times New Roman", size: 12pt)
  #set par(
    justify: false,
    first-line-indent: 0pt,
    leading: 0.65em,
    spacing: 0.65em,
  )

  #align(center)[
    #present-lines(
      upper[#organization.name],
      if organization.status != none { upper[#organization.status] },
    )
    #if school != none [
      #v(10pt)
      #school
    ]
  ]

  #v(2fr)

  #align(center)[
    #set text(size: 16pt, weight: "bold")
    #present-lines(
      report-heading(report-type, report-number),
      if subject != none [«#subject»],
    )
  ]

  #v(2fr)

  #align(right)[
    #if student-name != none [
      #students-block(student-name, group)
    ]
    #if instructor-name != none [
      #v(10pt)
      #present-lines(
        [#instructor-label:],
        [#instructor-name],
      )
    ]
  ]

  #v(1fr)
]
