<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Gyroscopic Card

Gyroscopic Card is a Flutter package that provides an interactive, gyroscope-responsive card widget. It adds a realistic 3D tilting effect based on device orientation, making it ideal for applications aiming to create an immersive and interactive user experience.

## Features

- **Gyroscope-Based Rotation**: Adds real-time rotation based on device orientation.
- **Customizable Sensitivity and Rotation Limits**: Fine-tune rotation sensitivity and maximum tilt angle to match your design.
- **Flexible Card Properties**: Customize appearance, including elevation, shape, color, and shadow.
- **Supports Any Child Widget**: Easily integrate text, images, or any widget inside the gyroscopic card.

## Getting Started

To use this package, ensure you have Flutter set up and add the package to your `pubspec.yaml` file.

```yaml
dependencies:
  gyroscopic_card: ^1.0.0
## Usage

Wrap any widget with GyroscopicCard to add gyroscope-driven tilt effects. Here’s a basic example

```dart
import 'package:flutter/material.dart';
import 'package:gyroscopic_card/gyroscopic_card.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GyroscopicCard(
            sensitivity: 0.05,
            maxAngleRadians: 0.785, // 45 degrees in radians
            child: Container(
              width: 250,
              height: 350,
              alignment: Alignment.center,
              child: Text(
                'Gyroscopic Card',
                style: TextStyle(fontSize: 24),
              ),
            ),
            cardProperties: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

