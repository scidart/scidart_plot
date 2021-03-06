import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/primitives/visibility.dart';
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
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;
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
        this.unit = 'px',
        this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var xml = '<ellipse cx="${cx}${unitConv(unit)}" cy="${cx}${unitConv(
        unit)}" rx="${rx}${unitConv(unit)}" ry="${ry}${unitConv(unit)}" '
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
