## Mermaid
Mermaid - это сильно упрощённый и далекий аналог
**UML** - специальный язык описания блок-схем, графиков и диаграмм с их визуализацией.

### Блок схемы
```mermaid
flowchart LR
    A[Вопрос: Как сделать список?] --> B["Ответ: `-` или `*`"]
    A --> C["Пример: \n - Пункт 1 \n - Пункт 2"]

```
#### базовая структура 1

flowchart LR
    A[Вопрос: Как сдеать список?] --> B["Ответ: - `-` или `*`"]
    A --> C["Пример: \n - Пункт 1 \n"]

* `flowchart` - блок-схема
* `LR` - направление вправо
* `A[],B[],C[]` - прямоугольник
* `-->` - стрелка связи

#### базовая структура 2

#### полный ситаксис блок-схем

### Диаграмма последовательности

```mermaid
flowchart TD
    Start([Начало]) --> Check{Есть ли данные?}
    Check -->|Да| Process[Обработать данные]
    Check -->|Нет| Error[Вернуть ошибку]
    Process --> Result([Результат])
    Error --> Result
```
### Диаграмма класса
```mermaid
classDiagram
    class User {
        +id: int
        +email: string
        +register()
        +login()
    }
    class Order {
        +id: int
        +userId: int
        +total: decimal
        +create()
    }

    User "1" -- "*" Order : размещает

```

### Диаграмма Ганта
```mermaid
gantt
    title План разработки фичи «Личный кабинет»
    dateFormat  YYYY-MM-DD
    excludesWeekdays 0,6

    section Разработка
        Backend API:       done, 2025-10-01, 2025-10-05
        Frontend формы:    active, 2025-10-06, 2025-10-12

    section Тестирование
        Unit-тесты:        2025-10-13, 2025-10-14
        E2E тесты:         2025-10-15, 2025-10-16

```

### Граф зависимостей
```mermaid
graph LR
    Auth --> Users
    Users --> Orders
    Orders --> DB
    Orders --> Queue
    Auth --> DB
```
### Диаграмма состояний
```mermaid
stateDiagram-v2
    [*] --> Draft
    Draft --> Review: submit()
    Review --> Approved: approve()
    Review --> Draft: reject()
    Approved --> Shipped: ship()
    Shipped --> [*]

    note right of Review
        Требуется проверка QA
    end note

```
### Юзер-джайрни
```mermaid
stateDiagram-v2
    [*] --> Draft
    Draft --> Review: submit()
    Review --> Approved: approve()
    Review --> Draft: reject()
    Approved --> Shipped: ship()
    Shipped --> [*]

    note right of Review
        Требуется проверка QA
    end note

```
### Кастомизация стилей
```mermaid
%%{init: {'theme':'default','themeVariables':{'primaryColor':'#2E7D32','edgeLabelBackground':'#FFFFFF'}}}%%

```

### круговая диаграмма
```mermaid


pie
    title ОС на десктопе
    "Windows" : 70
    "MacOS" : 25
    "Linux" : 7
    "Other" : 3

 ```

### классы сss
```mermaid
classDiagram
    class User
    class Order
    %%{init: {'theme': 'default'}}%%
    style User fill:#E8F5E9,stroke:#2E7D32,stroke-width:2px
    style Order fill:#FFF3E0,stroke:#EF6C00,stroke-width:2px

```