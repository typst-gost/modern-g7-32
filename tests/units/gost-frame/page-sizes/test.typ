#import "/src/gost-frame/page-sizes.typ": page-size-name, page-sizes

#for ((side-a, side-b, name)) in page-sizes {
  assert.eq(page-size-name(side-a, side-b), name)
  assert.eq(page-size-name(side-b, side-a), name)
}

// Допуск покрывает погрешность вычисленных физических размеров.
#assert.eq(page-size-name(210.005, 297), "A4")

Проверены все форматы в обеих ориентациях.
