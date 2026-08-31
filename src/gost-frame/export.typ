#import "gost-params.typ": change, form-data, person, stamp-data
#import "stamp.typ": gost-frame
#import "tables-eskd.typ": (
  eskd-AG-3,
  eskd-AG-5,
  form-1,
  form-2,
  form-2a,
  form-2b,
)
#import "tables-spds.typ": (
  form-3,
  form-4,
  form-5,
  form-6,
  spds-AG-3,
  spds-AG-7,
)

#let frame-form(factory, size) = {
  assert(type(factory) == function, message: "factory должен быть функцией")
  assert(
    type(size) == dictionary and "width" in size and "height" in size,
    message: "size должен содержать width и height",
  )
  assert(
    type(size.width) == length and type(size.height) == length
      and size.width > 0pt and size.height > 0pt,
    message: "width и height должны быть положительными абсолютными длинами",
  )
  (factory: factory, size: size)
}

// Публичный каталог стандартных форм. Пространства имён не засоряют API пакета
// общими названиями наподобие `form-1` и `form-3`.
#let frame-forms = (
  eskd: (
    form-1: frame-form(form-1, (width: 185mm, height: 60mm)),
    form-2: frame-form(form-2, (width: 185mm, height: 45mm)),
    form-2a: frame-form(form-2a, (width: 185mm, height: 20mm)),
    form-2b: frame-form(form-2b, (width: 185mm, height: 20mm)),
    ag-3: frame-form(eskd-AG-3, (width: 12mm, height: 85mm)),
    ag-5: frame-form(eskd-AG-5, (width: 12mm, height: 145mm)),
  ),
  spds: (
    form-3: frame-form(form-3, (width: 185mm, height: 60mm)),
    form-4: frame-form(form-4, (width: 185mm, height: 60mm)),
    form-5: frame-form(form-5, (width: 185mm, height: 45mm)),
    form-6: frame-form(form-6, (width: 185mm, height: 20mm)),
    ag-3: frame-form(spds-AG-3, (width: 12mm, height: 85mm)),
    ag-7: frame-form(spds-AG-7, (width: 15mm, height: 150mm)),
  ),
)
