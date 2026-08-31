#import "/src/export.typ": frame-forms, gost-frame, stamp-data

#set page(paper: "a4")
#set text(size: 11pt, lang: "ru")

#let scenario(
  title,
  frame-only: false,
  use-additional: true,
  use-frame: true,
  use-numbering: true,
) = {
  show: gost-frame.with(
    form-start: frame-forms.spds.form-3,
    additional-start: frame-forms.spds.ag-7,
    form-other: frame-forms.spds.form-6,
    additional-other: frame-forms.spds.ag-3,
    data: stamp-data(),
    frame-only: frame-only,
    use-additional: use-additional,
    use-frame: use-frame,
    use-numbering: use-numbering,
  )

  [= #title]
  lorem(30)
}

#scenario([Полное оформление])
#pagebreak()
#scenario([Только рамка], frame-only: true)
#pagebreak()
#scenario([Без дополнительных граф], use-additional: false)
#pagebreak()
#scenario([Без нумерации], use-numbering: false)
#pagebreak()
#scenario([Без внешней рамки], use-frame: false)
#pagebreak()

#{
  set page(flipped: true)
  scenario([Альбомная ориентация])
}
