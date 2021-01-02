import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
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
  @override
  String id;
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
  @override
  Unit unit;
  @override
  Visibility visibility;

  // not used
  @override
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
    this.unit,
    this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var xml = '<line x1="${roundPixels(x1, unit)}" y1="${roundPixels(y1, unit)}" '
        'x2="${roundPixels(x2, unit)}" y2="${roundPixels(y2, unit)}" '
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
