#let default-text-size = (default: 14pt, small: 10pt)
#let default-indent = 1.25cm
#let default-margin = (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm)
#let default-justify = true
#let default-leading = 1.5em - 0.75em
#let default-spacing = 1.5em
#let default-figure-margin-bottom = 0.5em
#let default-list-spacing = 1em
#let default-enum-spacing = 1em
#let default-outline-depth = 3
#let default-heading-margin = (below: 2em, above: 2em)

#let university-styles = (
  default: (
    font: none,
    heading-margin: default-heading-margin,
    title-template: "default",
  ),
  mirea: (
    font: "Times New Roman",
    heading-margin: (
      above: default-leading,
      below: default-leading,
    ),
    title-template: "mirea-university-report",
  ),
)

#let resolve-university-style(university) = {
  if university == none {
    return university-styles.default
  }

  if type(university) == str {
    assert(
      university in university-styles.keys(),
      message: "Неизвестный университет '" + repr(university) + "'",
    )
    return university-styles.at(university)
  }

  panic("Параметр university должен быть строкой или none")
}
