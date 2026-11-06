# Дополнительные навыки к drevo-skill

Этот форк сохраняет оригинальный каталог drevo и добавляет универсальный навык rod-search — доказательный поиск родословных по архивам России, Российской империи и СССР.

- drevo — проверка GEDCOM, источников, сохранение документов, аудит поколений.
- rod-search — поиск нужных архивных источников, варианты имён и мест, проверка однофамильцев, журнал и шаблон отчёта.

Каталог родословных сайтов: rod-search/references/source-catalog.md
Методика поиска: rod-search/references/search-method.md

## Установка в OpenCode (PowerShell)

Клонировать форк:
    git clone https://github.com/vanitoo/drevo-skill.git C:\project\genealogy-skills

Установить в отдельный приватный семейный проект:
    cd C:\project\genealogy-skills
    .\scripts\install-all-opencode.ps1 -ProjectPath 'C:\project\genealogy'
    cd C:\project\genealogy
    Test-Path '.\.opencode\skills\drevo\SKILL.md'
    Test-Path '.\.opencode\skills\rod-search\SKILL.md'
    Get-ChildItem '.\.opencode\skills' -Directory

Затем запустите `opencode` и попросите агента загрузить навыки `drevo` и `rod-search` через инструмент `skill`. Команда `opencode debug skill` доступна не во всех версиях OpenCode; её отсутствие не означает, что навыки не установлены.

Установка из исходников только копирует каталоги навыков; она не создаёт или публикует данные семьи. Для обновления после просмотра diff указать -Force; предыдущие каталоги навыков будут перенесены в резервные копии.

## Обновление от автора

    cd C:\project\genealogy-skills
    git remote add upstream https://github.com/oxyberg/drevo-skill.git
    git fetch upstream
    git merge upstream/main
    git push origin main

Команду remote add достаточно выполнить один раз. Перед merge убедиться, что рабочий каталог чист; при конфликтах разрешать их вручную. После обновления повторно установить навыки и запустить проверки. Не делать reset --hard или force push для синхронизации.

## Безопасность

Форк публичный: здесь нет и не должно быть GEDCOM, фотографий, имён живущих людей, закрытых запросов и учётных данных. Основной семейный архив хранится отдельно в приватном хранилище.

В оригинальном drevo-skill на момент создания форка не обнаружена явная лицензия; сохранять происхождение и авторство исходного кода. Собственные дополнения не меняют правовой режим оригинальных файлов.
