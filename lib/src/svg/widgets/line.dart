import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/primitives/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';
import 'abstract/unit_converter.dart';

/// Generate a line
class Line implements SvgWidget {
  double x1;
  double y1;
  double x2;
  double y2;

  // override
  String id;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;
  String unit;
  Visibility visibility;

  // not used
  Color fill;

  /// Line constructor
  /// [x1] start x coordinate point
  /// [y1] start y coordinate point
  /// [x2] end x coordinate point
  /// [y2] end y coordinate point
  /// [id] widget id to made some reference in the SVG file
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)]
  /// [visibility] visibility of the element, default is inherit
  Line({@required this.x1,
    @required this.y1,
    @required this.x2,
    @required this.y2,
    this.id,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform,
    this.unit = 'px',
    this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var xml = '<line x1="${x1}${unitConv(unit)}" y1="${y1}${unitConv(
        unit)}" x2="${x2}${unitConv(unit)}" y2="${y2}${unitConv(unit)}" '
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
