import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/primitives/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';
import 'abstract/unit_converter.dart';

/// Generate a text element
class Text implements SvgWidget {
  double x;
  double y;
  String text;
  double rotate;

  //override
  @override
  String unit;
  @override
  String id;
  @override
  Color fill;
  @override
  Color stroke;
  @override
  double strokeWidth;
  @override
  String strokeDasharray;
  @override
  String style;
  @override
  String transform;
  @override
  Visibility visibility;

  /// Text constructor
  /// [x] left top x coordinate of the text
  /// [y] left top y coordinate of the text
  /// [text] text that will be displayed
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  /// [visibility] visibility of the element, default is inherit
  Text(
      {@required this.x,
      @required this.y,
      @required this.text,
      this.rotate,
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
    var xml = '<text x="${x}${unitConv(unit)}" y="${y}${unitConv(unit)}" '
        '${attributes(
        id,
        fill,
        stroke,
        strokeWidth,
        strokeDasharray,
        style,
        transform,
        unit,
        visibility)} >'
        '${text}'
        '</text>';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
