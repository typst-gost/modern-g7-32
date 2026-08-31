// Модель данных основной надписи. В этом файле нет данных конкретного
// документа: он содержит только публичные конструкторы и функции чтения.

// Запись об ответственном лице. Порядок записей в `people` соответствует
// порядку строк выбранной формы.
#let person(
  role: none,
  name: none,
  signature: none,
  date: none,
) = (
  role: role,
  name: name,
  signature: signature,
  date: date,
)

// Данные одной строки регистрации изменений.
#let change(
  index: none,
  sections: none,
  sheet: none,
  document: none,
  signature: none,
  date: none,
) = (
  index: index,
  sections: sections,
  sheet: sheet,
  document: document,
  signature: signature,
  date: date,
)

// Данные одной системы стандартов. `fields` хранит значения крупных граф по
// их официальным номерам: например, ("1": [...], "2": [...]). Отдельные
// структуры не дают перепутать одинаковые номера граф в разных блоках.
#let form-data(
  fields: (:),
  change: (:),
  people: (),
  inventory: (:),
  approval: (:),
  copied-by: none,
  paper-size: none,
) = (
  fields: fields,
  change: change,
  people: people,
  inventory: inventory,
  approval: approval,
  copied-by: copied-by,
  paper-size: paper-size,
)

// Корневой объект документа. Раздельные секции нужны потому, что номера и
// смысл некоторых граф ЕСКД и СПДС не совпадают.
#let stamp-data(
  eskd: form-data(),
  spds: form-data(),
) = (
  eskd: eskd,
  spds: spds,
)

#let _or(value, default) = if value == none { default } else { value }

#let _section(data, standard) = {
  if data == none {
    form-data()
  } else if standard in data {
    data.at(standard)
  } else {
    // Позволяет передать `form-data` напрямую при использовании только одной
    // системы стандартов.
    data
  }
}

#let _value(dictionary, key, default: []) = {
  if key in dictionary {
    _or(dictionary.at(key), default)
  } else {
    default
  }
}

// Значение крупной нумерованной графы.
#let field(data, standard, number, default: []) = {
  let section = _section(data, standard)
  let fields = _value(section, "fields", default: (:))
  _value(fields, str(number), default: default)
}

// Значение единственной строки регистрации изменений, предусмотренной
// текущими шаблонами.
#let change-value(data, standard, key, default: []) = {
  let section = _section(data, standard)
  let values = _value(section, "change", default: (:))
  _value(values, key, default: default)
}

#let person-value(data, standard, index, key, default: []) = {
  let section = _section(data, standard)
  let people = _value(section, "people", default: ())
  if index < people.len() {
    _value(people.at(index), key, default: default)
  } else {
    default
  }
}

#let inventory-value(data, standard, number, default: []) = {
  let section = _section(data, standard)
  let values = _value(section, "inventory", default: (:))
  _value(values, str(number), default: default)
}

#let approval-value(data, standard, number, default: []) = {
  let section = _section(data, standard)
  let values = _value(section, "approval", default: (:))
  _value(values, str(number), default: default)
}

#let copied-by(data, standard, default: []) = {
  let section = _section(data, standard)
  _value(section, "copied-by", default: default)
}

#let paper-format(data, standard, automatic) = {
  let section = _section(data, standard)
  _value(section, "paper-size", default: automatic)
}
