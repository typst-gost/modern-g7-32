// Титульный лист учебной работы МГУ имени М. В. Ломоносова.
// Канон — отчёты по практикуму ВМК: без строки министерства,
// без линий для подписей и дат; исполнитель и руководитель — текстом справа.

#let arguments(..args, year: auto) = {
  let args = args.named()

  args.organization = args.at(
    "organization",
    default: "Московский государственный университет имени М. В. Ломоносова",
  )
  args.faculty = args.at("faculty", default: none)
  args.department = args.at("department", default: none)
  args.logo = args.at("logo", default: none)
  args.report-type = args.at("report-type", default: "Отчёт по практикуму")
  args.subject = args.at("subject", default: none)
  args.group = args.at("group", default: none)
  args.student-label = args.at("student-label", default: "Студент")
  args.student-name = args.at("student-name", default: none)
  args.supervisor-label = args.at("supervisor-label", default: "Преподаватель")
  args.supervisor-position = args.at("supervisor-position", default: none)
  args.supervisor-name = args.at("supervisor-name", default: none)

  args
}

#let present-lines(..items) = {
  items.pos().filter(line => line != none).join(linebreak())
}

#let student-position(student-label, group) = {
  if group == none {
    [#student-label]
  } else {
    [#student-label #group группы]
  }
}

#let template(
  organization: "Московский государственный университет имени М. В. Ломоносова",
  faculty: none,
  department: none,
  logo: none,
  report-type: "Отчёт по практикуму",
  subject: none,
  group: none,
  student-label: "Студент",
  student-name: none,
  supervisor-label: "Преподаватель",
  supervisor-position: none,
  supervisor-name: none,
) = [
  #set text(font: "Times New Roman", size: 14pt)
  #set par(
    justify: false,
    first-line-indent: 0pt,
    leading: 0.65em,
    spacing: 0.65em,
  )

  #align(center)[
    #if logo != none [#logo #v(4pt)]
    #present-lines(
      organization,
      faculty,
      department,
    )
  ]

  #v(2fr)

  #align(center)[
    #text(size: 16pt)[#report-type]
    #if subject != none [
      #v(8pt)
      #text(size: 18pt, weight: "bold")[«#subject»]
    ]
  ]

  #v(2fr)

  #align(right)[
    #if student-name != none [
      #present-lines(
        [Выполнил:],
        emph(student-position(student-label, group)),
        [#student-name],
      )
    ]
    #if supervisor-name != none [
      #v(10pt)
      #present-lines(
        emph[#supervisor-label:],
        supervisor-position,
        [#supervisor-name],
      )
    ]
  ]

  #v(1.5fr)
]
