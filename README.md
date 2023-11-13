# CocktailParty (проект в процессе написания)

Мобильное приложение созданное при помощи фреймворка SwiftUI на базе [TheCocktailDB](https://www.thecocktaildb.com/api.php) API.

**Стек**: SwiftUI, WidgetKit, MVVM, Coordinator, URLSession

**Особенности**:
API имеет свои ограничени по выдаче данных и сложности по структуре объектов, поэтому, для удобства работы, объекты
инициализируются в более подходящие модели.
Фичи, которые мне хотелось реализовать, но это оказалось невозможным со стороны API, отмечены (*),
и реализованы исключительно со стороны фронтэнда.

**Фичи**:
- Возможностью выбора типа коктельной вечеринки в зависимоти от категории: алкогольная, безалкогольная, случайная
- Анимация главного экрана на основе изменения параметров графических элементов
- Экран с коллекцией коктейлейтвыбранной категории на основе LazyVGrid
- (*) Возможность ставить лайк понравившемуся коктейлю (эмитация добавления в избранное)
- Экран с подробной информацией о коктейле
- Виджет, ежедневно выполняющий запрос к API и отображающий "Коктейль дня"
- Приложение реализовано на базе темной темы
.....
_________________
App created with SwiftUI and [TheCocktailDB](https://www.thecocktaildb.com/api.php) API.

**Stack**: SwiftUI, WidgetKit, MVVM, Coordinator, URLSession, 

**Notes**:
The API has limitations in terms of data output and complexity in the structure of objects. Therefore, the objects provided by the API are
initialized into more suitable models.
Features, that I wanted to implement, but this turned out to be impossible, due to the API limitations are marked (*)
and implemented exclusively at the frontend.

**Features**:
- Ability to select the type of cocktail party depending on the category: alcoholic, non-alcoholic, random
- Animation of the main screen based on changing the parameters of graphic elements
- Screen with a cocktails collection based on LazyVGrid
- (*) Ability to like a favorite cocktail (mock of adding to favorites)
- Detail screen with information about a cocktail
- Widget that makes a daily api call and displays the “Cocktail of the Day”
- App is based on a dark theme
​
​

  
