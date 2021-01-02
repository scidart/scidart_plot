import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';
import 'abstract/unit_converter.dart';

/// Generate a circle
class Circle implements SvgWidget {
  double cx;
  double cy;
  double r;

  // override
  @override
  String id;
  @override
  Color fill;
  @override
  Color stroke;
  @override
  double strokeWidth;
  @override
  StrokeDasharray strokeDasharray;
  @override
  String style;
  @override
  String transform;
  // ignore: annotate_overrides
  String unit;
  @override
  Visibility visibility;

  /// Circle constructor
  /// [cx] center x coordinate of the circle
  /// [cy] center y coordinate of the circle
  /// [r] circle radius
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  /// [visibility] visibility of the element, default is inherit
  Circle({@required this.cx,
    @required this.cy,
    @required this.r,
    this.id,
    this.fill,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform,
    this.unit = 'px',
    this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var xml = '<circle cx="${roundPixels(cx, unit)}" cy="${roundPixels(cy, unit)}" '
        'r="${roundPixels(r, unit)}" '
        '${attributes(
        id,
        fill,
        stroke,
        strokeWidth,
        strokeDasharray,
        style,
        transform,
        unit,
        visibility)} />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
