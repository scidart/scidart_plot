import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/stroke_width.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';
import 'abstract/unit_converter.dart';

/// Generate a Ellipse
class Ellipse implements SvgWidget {
  double cx;
  double cy;
  double rx;
  double ry;

  // override
  @override
  String id;
  @override
  Color fill;
  @override
  Color stroke;
  @override
  StrokeWidth strokeWidth;
  @override
  StrokeDasharray strokeDasharray;
  @override
  String style;
  @override
  String transform;
  @override
  Unit unit;
  @override
  Visibility visibility;

  /// Ellipse constructor
  /// [cx] center x coordinate of the ellipse
  /// [cy] center y coordinate of the ellipse
  /// [rx] ellipse radius in x
  /// [ry] ellipse radius in y
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  /// [visibility] visibility of the element, default is inherit
  Ellipse(
      {@required this.cx,
      @required this.cy,
      @required this.rx,
      @required this.ry,
      this.id,
      this.fill,
      this.stroke,
      this.strokeWidth,
      this.strokeDasharray,
      this.style,
      this.transform,
      this.unit,
      this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var xml =
        '<ellipse cx="${roundPixels(cx, unit)}" cy="${roundPixels(cx, unit)}" '
        'rx="${roundPixels(rx, unit)}" ry="${roundPixels(ry, unit)}" '
        '${attributes(id, fill, stroke, strokeWidth, strokeDasharray, style, transform, unit, visibility)} />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
