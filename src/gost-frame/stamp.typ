#import "tables-eskd.typ": *
#import "tables-spds.typ": *
#import "place-rules.typ": *
#import "other.typ": *
#import "gost-params.typ": *

#let gost-frame(
  form-start: none,
  additional-start: none,
  form-other: none,
  additional-other: none,
  data: stamp-data(),
  form-format-row-height: format-row-height,
  frame-only: false,
  use-additional: true,
  use-numbering: true,
  use-frame: true,
  body,
) = {
  // frame-only оставляет только внешнюю рамку.
  let effective-use-frame = use-frame or frame-only
  let effective-use-numbering = use-numbering and not frame-only

  // Стандартные и пользовательские формы передаются дескриптором frame-form.
  let resolve-form(form) = if form == none {
    (content: none, size: none)
  } else if type(form) == dictionary and "factory" in form and "size" in form {
    (content: (form.factory)(data: data), size: form.size)
  } else if type(form) == function {
    (content: form(data: data), size: none)
  } else {
    (content: form, size: none)
  }

  let empty-form = (content: none, size: none)
  let start-form = if frame-only { empty-form } else { resolve-form(form-start) }
  let other-form = if frame-only { empty-form } else { resolve-form(form-other) }
  let start-additional = if frame-only or not use-additional {
    empty-form
  } else {
    resolve-form(additional-start)
  }
  let other-additional = if frame-only or not use-additional {
    empty-form
  } else {
    resolve-form(additional-other)
  }
  for form in (start-form, other-form, start-additional, other-additional) {
    assert(
      form.content == none or form.size != none,
      message: "Для пользовательской формы укажите размер через frame-form",
    )
  }
  let form-height(form) = if form.content == none {
    0pt
  } else {
    form.size.height
  }
  let form-body-height(form) = if form.content == none {
    0pt
  } else {
    calc.max(form-height(form) - form-format-row-height, 0pt)
  }

  let page-number-height = if effective-use-numbering {
    page-number-size.height
  } else {
    0pt
  }

  // Текст остаётся ниже отдельного блока номера страницы.
  let top-shift = frame-margin.top + if inside-frame-margin.top > page-number-height {
    inside-frame-margin.top
  } else {
    page-number-height + 1mm
  }

  // Нижние отступы + высота таблицы без служебной строки формата.
  let bottom-margin = (
    inside-frame-margin.bottom + frame-margin.bottom
    + calc.max(form-body-height(start-form), form-body-height(other-form))
  )
  // Отдельный ключ не смешивает первые листы нескольких областей gost-frame.
  let sheet-counter = counter("modern-g7-32-frame-sheet:" + repr(body))

  set page(
    background: if effective-use-frame { frame } else { none },
    header: if effective-use-numbering {
      top-right-inside(content: page-number)
    } else {
      none
    },
    margin: (
      left: frame-margin.left + inside-frame-margin.left,
      top: top-shift,
      right: frame-margin.right + inside-frame-margin.right,
      bottom: bottom-margin,
    ),
    footer-descent: 100%, // Привязка place идёт от верхней границы footer.
    footer: context {
      if sheet-counter.get().first() == 0 {
        if start-form.content != none {
          bottom-right-inside(form: start-form.content, form-size: start-form.size)
        }
        if start-additional.content != none {
          bottom-left-outside(
            form: start-additional.content,
            form-size: start-additional.size,
          )
        }
      } else {
        if other-form.content != none {
          bottom-right-inside(form: other-form.content, form-size: other-form.size)
        }
        if other-additional.content != none {
          bottom-left-outside(
            form: other-additional.content,
            form-size: other-additional.size,
          )
        }
      }
      sheet-counter.step()
    },
  )

  body
}
