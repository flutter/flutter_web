// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web_test/flutter_web_test.dart';
import 'package:flutter_web/widgets.dart';
import 'package:flutter_web_ui/ui.dart';

void main() {
  testWidgets('Events bubble up the tree', (WidgetTester tester) async {
    final List<String> log = <String>[];

    await tester.pumpWidget(Listener(
        onPointerDown: (_) {
          log.add('top');
        },
        child: Listener(
            onPointerDown: (_) {
              log.add('middle');
            },
            child: DecoratedBox(
                decoration: const BoxDecoration(),
                child: Listener(
                    onPointerDown: (_) {
                      log.add('bottom');
                    },
                    child:
                        const Text('X', textDirection: TextDirection.ltr))))));

    await tester.tap(find.text('X'));

    expect(
        log,
        equals(<String>[
          'bottom',
          'middle',
          'top',
        ]));
  });

  // Regression test for https://github.com/flutter/flutter/issues/35114.
  testWidgets(
      'Listener should paint child only once when hover annotation is attached',
      (WidgetTester tester) async {
    final List<String> log = <String>[];
    _TestPainter painter = _TestPainter();
    await tester.pumpWidget(
      Listener(
        onPointerHover: (_) {},
        child: Container(
          width: 300,
          height: 300,
          color: Color(0xFF00FF00),
          child: CustomPaint(size: Size(300, 300), painter: painter),
        ),
      ),
    );

    // At this point it should have painted once.
    expect(painter.paintCounter, 1);

    // Hover over container area so it repaints with hover annotation.
    final TestGesture gesture =
        await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer();
    await gesture.moveTo(tester.getCenter(find.byType(Container)));
    await tester.pumpAndSettle();
    await gesture.removePointer();

    expect(painter.paintCounter, 2);
  });
}

class _TestPainter extends CustomPainter {
  _TestPainter();

  int paintCounter = 0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(10, 10), Offset(20, 20), new Paint()..color = Color(0xFFFF0000));
    paintCounter++;
  }

  @override
  bool shouldRepaint(_TestPainter oldPainter) => true;
}
