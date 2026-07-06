#import "../utils.typ": fetch-field, small-text, unbreak-name

#let arguments(..args, year: auto) = {
  let args = args.named()

  args.ministry = args.at("ministry", default: "МИНОБРНАУКИ РОССИИ")
  args.organization = fetch-field(
    args.at("organization", default: none),
    ("full", "short"),
    default: (
      full: "«МИРЭА – Российский технологический университет»",
      short: "РТУ МИРЭА",
    ),
    hint: "организации",
  )
  args.institute = fetch-field(
    args.at("institute", default: none),
    ("name", "caption"),
    default: (caption: "(наименование института, филиала)"),
    hint: "института",
  )
  args.department = fetch-field(
    args.at("department", default: none),
    ("name", "caption"),
    default: (caption: "(наименование кафедры)"),
    hint: "кафедры",
  )

  args.report-number = args.at("report-number", default: none)
  args.discipline = args.at("discipline", default: none)
  args.group = args.at("group", default: none)
  args.student-name = args.at("student-name", default: none)
  args.reviewer-name = args.at("reviewer-name", default: none)
  args.reviewer-position = args.at(
    "reviewer-position",
    default: "Преподаватель кафедры",
  )

  args
}

#let title-divider() = {
  align(center)[#line(length: 93%)]
}

#let centered-lines(body, leading: 0.6em) = {
  align(center)[
    #set par(
      justify: false,
      first-line-indent: 0pt,
      spacing: -3pt,
      leading: leading,
    )
    #body
  ]
}

#let institute-department-block(value, caption) = {
  [
    #centered-lines[
      #text(weight: "bold")[#value]
    ]
    #v(-14pt)
    #line(length: 100%)
    #v(-16pt)
    #centered-lines[
      #text(size: 12pt)[#emph[#caption]]
    ]
  ]
}

#let sign-row(label, position, name) = {
  [
    #set par(
      justify: false,
      first-line-indent: 0pt,
      spacing: 6pt,
      leading: 1em,
    )

    #label
    #v(1pt)
    #grid(
      columns: (1.5fr, auto, 1.6fr),
      gutter: 2mm,

      [#position],
      [#align(right)[#text("«__» _________ 20__ г.")]],
      [#align(right)[#text("___________") /#unbreak-name(name)]],

      [],
      [],
      [#align(center)[
        #set par(leading: 4pt, spacing: 0pt)
        #small-text[(подпись и расшифровка подписи)]
      ]],
    )
  ]
}

#let report-heading(report-number) = {
  if report-number == none {
    [#underline[ОТЧЁТ ПО ПРАКТИЧЕСКОЙ РАБОТЕ]]
  } else {
    [#underline[ОТЧЁТ ПО ПРАКТИЧЕСКОЙ РАБОТЕ №#report-number]]
  }
}

#let discipline-heading(discipline) = {
  if discipline == none {
    none
  } else {
    [#underline[ПО ДИСЦИПЛИНЕ «#upper(discipline)»]]
  }
}

#let student-position(group) = {
  if group == none {
    [Студент]
  } else {
    [Студент группы #group]
  }
}

#let template(
  ministry: "МИНОБРНАУКИ РОССИИ",
  organization: (
    full: "«МИРЭА – Российский технологический университет»",
    short: "РТУ МИРЭА",
  ),
  institute: (
    name: none,
    caption: "(наименование института, филиала)",
  ),
  department: (
    name: none,
    caption: "(наименование кафедры)",
  ),
  report-number: none,
  discipline: none,
  group: none,
  student-name: none,
  reviewer-name: none,
  reviewer-position: "Преподаватель кафедры",
) = [
  #set text(font: "Times New Roman", size: 12pt)
  #centered-lines(leading: 0.4em)[
    #text(weight: "bold")[РТУ МИРЭА]
    #v(10pt)

    #upper(ministry) \
    Федеральное государственное бюджетное образовательное учреждение \
    высшего образования \
    #text(weight: "bold")[#organization.full] \
    #text(weight: "bold")[#organization.short]
  ]

  #v(-14pt)
  #title-divider()
  #v(-15pt)

  #institute-department-block(institute.name, institute.caption)
  #v(8pt)
  #institute-department-block(department.name, department.caption)

  #v(14mm)

  #centered-lines(leading: 0.4em)[
    #set text(font: "Times New Roman", size: 14pt, weight: "bold")
    #report-heading(report-number)
    #if discipline != none [
      \
      #discipline-heading(discipline)
    ]
  ]

  #v(1fr)

  #if student-name != none [
    #sign-row(
      [Выполнил:],
      student-position(group),
      student-name,
    )
    #v(12pt)
  ]

  #if reviewer-name != none [
    #sign-row(
      [Проверил:],
      [#reviewer-position],
      reviewer-name,
    )
  ]

  #v(2.35fr)
]
