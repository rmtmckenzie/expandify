import 'package:expandify/expandify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Expands horizontally with 2', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    final key = GlobalKey();
    await tester.pumpWidget(
      WidgetsApp(
        pageRouteBuilder: <T>(settings, builder) => MaterialPageRoute<T>(builder: builder),
        home: Scaffold(
          body: Expandify(
            key: key,
            direction: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.blue, width: 100, height: 100),
                Container(color: Colors.red, width: 100, height: 100),
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );

    await expectLater(find.byKey(key), matchesGoldenFile('goldens/two_horizontal.png'));
  });

  testWidgets('Works horizontally with 5', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    final key = GlobalKey();
    final lastKey = GlobalKey();
    await tester.pumpWidget(
      WidgetsApp(
        pageRouteBuilder: <T>(settings, builder) => MaterialPageRoute<T>(builder: builder),
        home: Scaffold(
          body: Expandify(
            key: key,
            direction: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.blue, width: 100, height: 100),
                Container(color: Colors.red, width: 100, height: 100),
                Container(color: Colors.purple, width: 100, height: 100),
                Container(color: Colors.orange, width: 200, height: 100),
                Container(color: Colors.green, width: 100, height: 100, key: lastKey),
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );
    await expectLater(find.byKey(key), matchesGoldenFile('goldens/five_horizontal.png'));

    await tester.ensureVisible(find.byKey(lastKey, skipOffstage: false));
    await tester.pump();

    await expectLater(find.byKey(key), matchesGoldenFile('goldens/five_horizontal_scrolled.png'));
  });

  testWidgets('Expands vertically with 2', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    final key = GlobalKey();
    await tester.pumpWidget(
      WidgetsApp(
        pageRouteBuilder: <T>(settings, builder) => MaterialPageRoute<T>(builder: builder),
        home: Scaffold(
          body: Expandify(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.blue, width: 100, height: 100),
                Container(color: Colors.red, width: 100, height: 100),
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );

    await expectLater(find.byKey(key), matchesGoldenFile('goldens/two_vertical.png'));
  });

  testWidgets('Works vertically with 5', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 800));

    final key = GlobalKey();
    final lastKey = GlobalKey();
    await tester.pumpWidget(
      WidgetsApp(
        pageRouteBuilder: <T>(settings, builder) => MaterialPageRoute<T>(builder: builder),
        home: Scaffold(
          body: Expandify(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.blue, width: 100, height: 100),
                Container(color: Colors.red, width: 100, height: 100),
                Container(color: Colors.purple, width: 100, height: 100),
                Container(color: Colors.orange, width: 100, height: 600),
                Container(color: Colors.green, width: 100, height: 100, key: lastKey),
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );
    await expectLater(find.byKey(key), matchesGoldenFile('goldens/five_vertical.png'));

    await tester.ensureVisible(find.byKey(lastKey, skipOffstage: false));
    await tester.pump();

    await expectLater(find.byKey(key), matchesGoldenFile('goldens/five_vertical_scrolled.png'));
  });
}
