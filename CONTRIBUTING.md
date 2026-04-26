# Участие в разработке

## Тесты: Tytanic (`tt`)

Новый функционал и исправления, которые меняют поведение шаблона, вёрстку или типографику, нужно сопровождать **тестами [Typst Tytanic](https://github.com/typst-community/tytanic)** 

```bash
tt run
```

### Установка `tt`

Инструкции: [установка Tytanic](https://typst-community.github.io/tytanic/quickstart/install.html). (tl;dr `cargo binstall tytanic`)

### Добавление и обновление тестов

- Создать каркас: `tt new <идентификатор>`. Идентификатор — путь к каталогу теста **внутри** `tests/`, через `/`, **без** префикса `tests/` (например, `features/parameters/margin`).
- По умолчанию `tt new` создаёт **persistent**-тест: эталоны — PNG в `ref/`, сравнение при `tt run`.
- Если достаточно проверить только факт компиляции, подойдёт **compile-only**: `tt new --compile-only <идентификатор>` (каталога `ref/` не будет).
- После намеренного изменения внешнего вида обновите эталоны: `tt update --force <идентификатор>` и включите новые или изменённые файлы в `ref/` в коммит.

Подробнее о видах тестов и структуре каталогов: [Writing tests](https://typst-community.github.io/tytanic/guides/tests.html).

### Шрифты при локальном прогоне

Если диффы связаны со шрифтами, можно временно использовать системные:

```bash
tt --use-system-fonts run
```
