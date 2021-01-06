import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';

import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';

import 'package:scidart_plot/src/svg/enums/stroke_width.dart';

import 'package:scidart_plot/src/svg/enums/unit.dart';

import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/attributes.dart';

import 'abstract/svg_widget.dart';

class Arc implements SvgWidget {
  double cx;
  double cy;
  double r;
  double startAngle;
  double endAngle;

  @override
  Color fill;

  @override
  String id;

  @override
  Color stroke;

  @override
  StrokeDasharray strokeDasharray;

  @override
  StrokeWidth strokeWidth;

  @override
  String style;

  @override
  String transform;

  @override
  Unit unit;

  @override
  Visibility visibility;

  Arc({@required this.cx,
    @required this.cy,
    @required this.r,
    @required this.startAngle,
    @required this.endAngle,
    this.id,
    this.fill,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform,
    this.unit,
    this.visibility = Visibility.inherit});

  List<double> _polarToCartesian(centerX, centerY, radius, angleInDegrees) {
    final angleInRadians = (angleInDegrees-90) * pi / 180.0;
    final x = centerX + (radius * cos(angleInRadians));
    final y = centerY + (radius * sin(angleInRadians));
    return [x, y];
  }

  @override
  String toXML() {
    final start = _polarToCartesian(cx, cy, r, endAngle);
    final startX = start[0];
    final startY = start[1];

    final end = _polarToCartesian(cx, cy, r, startAngle);
    final endX = end[0];
    final endY = end[1];

    final largeArcFlag = endAngle - startAngle <= 180 ? '0' : '1';

    return '<path ${attributes(
          id,
          fill,
          stroke,
          strokeWidth,
          strokeDasharray,
          style,
          transform,
          unit,
          visibility)} '
        'd="M ${roundPixelsOnly(startX)} ${roundPixelsOnly(startY)} '
        'A ${roundPixelsOnly(r)} ${roundPixelsOnly(r)} 0 ${largeArcFlag} 0 ${endX} ${endY} '
        'L ${roundPixelsOnly(cx)} ${roundPixelsOnly(cy)}"/>';
  }
}