# x04_architecture_base

A new Flutter project.

## Getting Started

https://codewithandrea.com/articles/flutter-project-structure/

presentation: widgets, states, and controllers
application: services
domain: models
data: repositories, data sources, and DTOs (data transfer objects)

https://slides.com/mhadaily/flutter-architecture-inspired-strategic-domain-driven-design#/3/1
https://github.com/mhadaily/flutter-architecture-ddd/tree/master/simple/lib
https://github.com/mhadaily/flutter-architecture-ddd/tree/master/enterprise/lib

https://dev.to/rubemfsv/clean-architecture-applying-with-flutter-487b

LANGUAGES
https://medium.com/@lumeilin301/multi-language-in-flutter-ee393b298ec5
https://docs.flutter.dev/accessibility-and-localization/internationalization

GET WIDGET SIZE
https://stackoverflow.com/questions/49307677/how-can-i-get-the-height-of-a-widget/49650741#49650741
https://stackoverflow.com/questions/49307677/how-can-i-get-the-height-of-a-widget/74701386#74701386

KEYs
https://betterprogramming.pub/flutter-keys-the-why-when-and-how-to-go-about-them-85f12a5a0445

STRUCTURE EXAMPLE BY CHATGPT

lib/
|-- common/
|   |-- inherited_widgets/
|   |   |-- my_inherited_widget.dart
|-- features/
|   |-- feature_a/
|   |   |-- bloc/
|   |   |-- views/
|   |   |-- widgets/
|   |-- feature_b/
|   |   |-- bloc/
|   |   |-- views/
|   |   |-- widgets/
|-- main.dart

INHERITED WIDGETS
https://dev.to/solnsumei/easy-state-management-with-valuenotifiers-and-inherited-widgets-in-flutter-1070

STORE STATE IN INHERITED WIDGET
https://stackoverflow.com/questions/49491860/flutter-how-to-correctly-use-an-inherited-widget

COLOR SCHEME GENERATOR
https://m3.material.io/theme-builder#/custom
//https://api.flutter.dev/flutter/material/ColorScheme/ColorScheme.dark.html

FLUTTER NATIVE SPLASHSCREEN
To regenerate:
dart run flutter_native_splash:create --path=flutter_native_splash.yaml