# Examples:

See [main.dart](lib/main.dart) for a very simple example.

With two items and spaceBetween specified, it will look like this:

![Shows usage of expandify with items not taking the whole width. They are at each side of the viewport.](https://github.com/rmtmckenzie/expandify/raw/main/test/goldens/two_horizontal.png "Two Boxes Horizontal")

With the same set-up but 5 items, it will look like this:

![Shows usage of expandify with items taking the whole width. They aligned left-to-right with no space between.](https://github.com/rmtmckenzie/expandify/raw/main/test/goldens/five_horizontal.png "Five Boxes Horizontal")

From this code:

```dart
Expandify(
  direction: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(color: Colors.blue, width: 100, height: 50),
      Container(color: Colors.red, width: 100, height: 50),
      Container(color: Colors.purple, width: 100, height: 100),
      Container(color: Colors.orange, width: 200, height: 100),
      Container(color: Colors.green, width: 100, height: 100),
    ],
  ),
),
```

You'll notice that the green box is missing as it is off-screen; if we scroll this is what we'd see:

![Shows usage of expandify with items taking the whole width, scrolled to the far right to show the last box.](https://github.com/rmtmckenzie/expandify/raw/main/test/goldens/five_horizontal_scrolled.png "Five Boxes Horizontal Scrolled")
