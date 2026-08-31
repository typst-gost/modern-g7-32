#import "params.typ": *

#let bottom-left-outside(form: none, form-size: none) = context {
  if form != none {
    // После поворота ширина content задаёт толщину вертикального блока.
    let table-width = if form-size == none {
      measure(form).width
    } else {
      form-size.width
    }

    place(
      top + left,
      dy: -frame-margin.bottom,
      dx: -inside-frame-margin.left - table-width,
      form
    )
  }
}

#let bottom-right-inside(form: none, form-size: none) = context {

  // На узком листе форма сдвигается до левого края области рамки.

  if form != none {
    let form-size = if form-size == none { measure(form) } else { form-size }
    // page.width/page.height не меняются местами при page.flipped.
    let page-width = if page.flipped { page.height } else { page.width }

    let sum-marg-and-table = (
      frame-margin.left + frame-margin.right
      + inside-frame-margin.left + inside-frame-margin.right
      + form-size.width
    )

    let shift = if sum-marg-and-table >= page-width {
      sum-marg-and-table - page-width - inside-frame-margin.right
    } else {
      -inside-frame-margin.right
    }

    place(
      top + right,
      dy: -form-size.height + format-row-height - frame-margin.bottom,
      dx: -shift,
      form
    )
  }
}

#let top-right-inside(content: none) = {
  if content != none {
    // Блок номера прилегает к верхнему правому углу рамки.
    place(
      top + right,
      dx: inside-frame-margin.right,
      dy: frame-margin.top,
      content
    )
  }
}
