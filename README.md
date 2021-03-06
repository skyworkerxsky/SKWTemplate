# SKWTemplate

## Структура проекта:

**/Classes/** Основная папка проекта

- **/Сommon/** реализации вспомогательных модулей

    ### **ApplicationLayer/**

    - **/AppDelegate/** - главный делегат приложения (стараемся его не переполнять)
    - **/Dependencies/** - создание DI контейнеров и их конфигурация
    - **/MainCoordinator/** - создание window, глобальный роутинг по приложению

    ### **DataLayer/** - слой работы с данными (Модели, доступ к БД, Keychain, UD)

    - **/Models/** модели объектов
    - **/MoyaRepository/** репозиторий для работы с сетью
    - /**AuthRepository**/ хранение данных аутентификации
    - /**UserRepository**/ хранение данных о пользователе

    ### **ServiceLayer/** слой работы с бизнес логикой

    - **/ServiceName/** регистрация сервиса в DI, реализация бизнес логики (отправка запросов на сервер, обработка полученных данных/ошибок)
        - **/Requests/** - запросы в рамках одного сервиса

    ### **PresentationLayer/** - Модули проекта, вся UI логика

    - **/BaseClasses/** - реализации базовых классов, роутинг по модулям
    - **/Common/** - вспомогательные ui элементы для переиспользования, роутеры, валидатор, алерты
    - **/Modules/** - модули проекта MVVM
        - **/*Assembly** конфигурирование модуля и его регистрация в DI
        - **/*ViewController** - создание ui элементов, вёрстка, обработчики событий
        - **/*Router** - Содержит зависимости с другими модулями, а так же делегаты общения VC с VM (*ViewBehavior - делегат VC, *EventHandler - делегат VM)
        - **/*ViewModel** содержит логику связывающую бизнес логику с представлением (подключаемся к сервисам или другим модулям, инициирует обновления данных на View по средствам *EventHandler)
        - **/UI/** содержит непосредственно вёрстку проекта, либо в виде IB либо в виде кода
- **/Extensions/** Расширения базовых классов (стараемся писать универсальные для переиспользования расширения)
- **/Resources/** Ресурсы проекта (Assets, Fonts, Localization, Info, темы, константы, сторонние ресурсы)
- **/Vendor/**  Код заимствованный из других библиотек (в случае если нужно внести изменения в код библиотеки, мы её перемещаем сюда)

## Используемые библиотеки:

- **Alamofire** - для работы с сетью (на прямую с ней не взаимодействуем обычно)
- **Moya/RxSwift** - универсальны менеджер Api запросов работающий с Alamofire
- **DITranquillity** - реализация DI (управление зависимостями внутри приложения)
- **RxSwift/RxCocoa** - для реактивного программирования
- **ReactorKit** - фреймворк для реактивной и однонаправленной архитектуры
