import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/enums/alignment_y.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/font_size.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/stroke_width.dart';
import 'package:scidart_plot/src/svg/enums/text_anchor.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';
import 'abstract/unit_converter.dart';

/// Generate a text element
class Text implements SvgWidget {
  double x;
  double y;
  String text;
  TextAnchor textAnchor;
  AlignmentY alignmentY;
  FontSize fontSize;

  //override
  @override
  Unit unit;
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
      this.id,
      this.fill,
      this.stroke,
      this.strokeWidth,
      this.strokeDasharray,
      this.style,
      this.transform,
      this.unit,
      this.visibility = Visibility.inherit,
      this.textAnchor = TextAnchor.start,
      this.alignmentY = AlignmentY.bottom,
      this.fontSize});

  @override
  String toXML() {
    var xml = '<text x="${roundPixels(x, unit)}" y="${roundPixels(y, unit)}" '
        'text-anchor="${textAnchor.xmlValue}" '
        'font-size="${FontSize.toXml(fontSize)}" '
        'dy="${alignmentY.xmlValue}" '
        '${attributes(id, fill, stroke, strokeWidth, strokeDasharray, style, transform, unit, visibility)} >'
        '${text}'
        '</text>';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
