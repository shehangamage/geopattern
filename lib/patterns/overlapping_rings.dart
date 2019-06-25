import 'package:flutter/widgets.dart';

import 'pattern.dart';

class OverlappingRings extends Pattern {
  final double radius;
  final double strokeWidth;
  final int nx;
  final int ny;
  final List<Color> strokeColors;

  OverlappingRings(
      {@required this.radius,
      @required this.strokeWidth,
      @required this.nx,
      @required this.ny,
      @required this.strokeColors})
      : assert(strokeColors.length == nx * ny);

  void paint(Canvas canvas, double top, double left) {
    for (var y = 0; y < ny; y++) {
      for (var x = 0; x < nx; x++) {
        final i = y * nx + x;

        final cx = radius * x;
        final cy = radius * y;

        final fillPaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = strokeColors[i]
          ..strokeWidth = strokeWidth;

        canvas.drawCircle(
            Offset(left + cx, top + cy), radius - strokeWidth / 2, fillPaint);

        // NOTE: not doing boundaries for now
      }
    }
  }

  get width {
    return radius * nx;
  }

  get height {
    return radius * ny;
  }
}