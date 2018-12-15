# Flutter Carousel

A Carousel widget for flutter apps based on PageView widget

## Usage
Only the children is the required property and needs to have more than one children.

```dart
import 'package:flutter_carousel/flutter_carousel.dart';
Carousel(
    animationCurve: Curves.ease,
    animationDuration: const Duration(miliseconds: 250),
    displayDuration: const Duration(seconds: 2)
    children: <Widget>[
        Text('Slide 1'),
        Text('Slide 2'),
        Text('Slide 3'),
    ],
),
```