# Expandify

[![pub package][version_badge]](https://pub.dev/packages/expandify)

This package provides a very simple implementation of a widget which ensures
a child widget can take the height or width of the screen, but still be able
to scroll.

This is useful in the case where you want to show space between widgets when
there are less than fill the entire screen, but to have them touching (or 
close to it) when there many of them.

## Getting started

Add this package: `flutter pub add expandify`

## Usage

You can use Expandify similar to how you would use a SingleChildScrollView.
This is an example of using it horizontally:

```dart
return Expandify(
  direction: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(color: Colors.blue, width: 100, height: 100),
      Container(color: Colors.red, width: 100, height: 100),
    ],
  ),
);
```

And this is an example of using it vertically:

```dart
return Expandify(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(color: Colors.blue, width: 100, height: 100),
      Container(color: Colors.red, width: 100, height: 100),
    ],
  ),
),
```

## Examples:

See [examples](example/README.md).