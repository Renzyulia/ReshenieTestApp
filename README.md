# ReshenieTestApp

Тестовое приложение по техническому заданию.

Описание приложения: приложение позволяет пользователю осуществлять поиск фильмов. На главном экране пользователю предлагается подборка популярных фильмов. При нажатии на интересующийся фильм, открывается окно с деталями этого фильма: где можно прочесть подробное описание, жанр, страну-создателя. Если не удалось получить данные, то открывается окно с «ошибкой загрузки». При нажатии на кнопку «Поиск» открывается окно с текстовым полем куда пользователь может ввести нужное поисковое слово или слова. Если по данным словам нашлись совпадения, то данные фильм/фильмы показываются пользователю. Если совпадения не нашлось, то открывается окно с оповещением о том, что ничего не найдено. В случае ошибки загрузки показывается соотвествующий экран. При нажатии на фильм в окне поиска, пользователь также переходит на экран деталей этого фильма. 

Используемый стек:
MVC
UIKit
AutoLayout 
Git

На данный момент я не знакома хорошо с библиотекой SwiftUI, поэтому приложение написано с использованием UIKit. Но я готова его изучить и применять на практике в дальнейшем. Сейчас я поняла, что 7 дней - это слишком мало для качественного понимания такой обширной темы и отработки знаний, поэтому выбрала более знакомую среду.

Ввиду использования UIKit, я выбрала архитектуру MVC, так как посчитала, что данная архитектура достаточно гибкая, простая и хорошо подходит под задачи поставленные для реализации этого приложения. По моим ощущениям задачи эффективно решались с помощью императивного подхода и не возникло необходимости в использовании реактивного подхода.

Внутри структуру проекта я разделила по логике основных флоу. У меня получились три основных ситуации: пользователь видит список популярных фильмов, нажимает на какой-то из них и видит экран с деталями это фильма, либо нажимает на «поиск» и по ключевым словам находит один или несколько интересующих его фильмов.

View Controller экрана с популярными фильмами у меня является рутовым контроллером, и он управляет созданием остальных view. При усложнении проекта его можно декомпозировать. 

Также на экране показа популярных фильмов в navigation bar я добавила заголовок через leftBarButtonItem. Такое решение было выбрано потому как задача не требовала какого-то более сложного решения.

Для загрузки данных из сети я создала отдельный объект DataManager. Я сделала его синглтоном по аналогии с подходом Apple (URLSession.shared), так как задача простая и не требовалось DI контейнеров и подобных инструментов для управления зависимостями. При усложнении проекта будет лучше использовать более сложный инструмент.

Также из-за простоты задачи DataManager поддерживает только GET-запросы. Для нового функционала он может быть доработан, чтобы поддерживать другие типы запросов.

Для загрузки картинки по URL я создала ImageManager. Для поставленной задачи я решила сделать простую реализацию кэша для изображений. Для более сложных приложений стоит уже использовать либо NSCache, либо другие сторонние решения. 

Согласно дизайну технического задания на экране показа популярных фильмов, фильмы располагаются по возрастанию года их выхода. На экране поиска я решила не придерживаться такой же стратегии, потому как, по моим ощущениям, найденные фильмы должны располагаться в том порядке, каком их отдает сервер - это отвечает его внутренней логике совпадения по ключевым словам.

У некоторых фильмов в ответе сервера отсутствуют поля: «название», «описание», «жанр». Я сделала возвращение таких фильмов с полями заполненными таким образом: английское название фильма или, если его тоже нет, то «Без названия», «Описание отсутствует», «Неизвестный» соответственно. В случае необходимости другого решения данного момента, готова это исправить. 

Кнопка «назад» на экране просмотра деталей фильма всегда одного цвета и трудно различима на некоторых постерах фильмов. Это ошибка, которую я, к сожалению, не исправила из-за окончания сроков выполнения. Но я готова доработать этот момент. 

Так как в техническом задании не была указана минимальная версия системы iOS, я оставила значение по умолчанию. 

Очень хочется услышать обратную связь. Готова исправить все недочёты и пояснить возможные непонятные моменты, описать логику, которой я руководствовалась. Очень хочется еще глубже погружаться в сферу мобильной разработки и расти как профессионал в этом деле.

Благодарю. 
