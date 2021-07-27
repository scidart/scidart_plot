import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/stroke_width.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';
import 'abstract/unit_converter.dart';

/// Generate a rectangle
class Rect implements SvgWidget {
  double x;
  double y;
  double width;
  double height;

  // override
  @override
  String? id;
  @override
  Color? fill;
  @override
  Color? stroke;
  @override
  StrokeWidth? strokeWidth;
  @override
  StrokeDasharray? strokeDasharray;
  @override
  String? style;
  @override
  String? transform;
  @override
  Unit? unit;
  @override
  Visibility? visibility;

  /// Rect constructor
  /// [x] left top x coordinate of the rectangle
  /// [y] left top y coordinate of the rectangle
  /// [width] width of rectangle
  /// [height] height of rectangle
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  /// [visibility] visibility of the element, default is inherit
  Rect(
      {required this.x,
      required this.y,
      required this.width,
      required this.height,
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
    var xml = '<rect x="${roundPixels(x, unit)}" y="${roundPixels(y, unit)}" '
        'width="${roundPixels(width, unit)}" height="${roundPixels(height, unit)}" '
        '${attributes(id, fill, stroke, strokeWidth, strokeDasharray, style, transform, unit, visibility)} />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
