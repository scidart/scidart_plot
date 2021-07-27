import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/enums/stroke_dasharray.dart';
import 'package:scidart_plot/src/svg/enums/stroke_width.dart';
import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/enums/visibility.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import 'abstract/attributes.dart';

/// Class to generate SVG groups
///
/// # Constructors:
/// ```dart
/// Group(
///       {required this.children,
///       this.fill,
///       this.id,
///       this.stroke,
///       this.strokeDasharray,
///       this.strokeWidth,
///       this.style,
///       this.transform,
///       this.unit,
///       this.visibility = Visibility.inherit});
/// ```
class Group implements SvgWidget {
  List<SvgWidget> children;

  // override
  @override
  Color? fill;
  @override
  String? id;
  @override
  Color? stroke;
  @override
  StrokeDasharray? strokeDasharray;
  @override
  StrokeWidth? strokeWidth;
  @override
  String? style;
  @override
  String? transform;
  @override
  Unit? unit;
  @override
  Visibility? visibility;

  /// Group constructor
  /// [children] three with SVG elements
  /// [id] widget id to made some reference in the SVG file
  /// [fill] fill color
  /// [stroke] stroke line color
  /// [strokeWidth] stroke line width
  /// [strokeDasharray] stroke line dash style
  /// [style] custom css style
  /// [transform] custom css transformation
  /// [unit] unit used in the parameters, default is px (pixel)
  /// [visibility] visibility of the element, default is inherit
  Group(
      {required this.children,
      this.fill,
      this.id,
      this.stroke,
      this.strokeDasharray,
      this.strokeWidth,
      this.style,
      this.transform,
      this.unit,
      this.visibility = Visibility.inherit});

  @override
  String toXML() {
    var gXml = '';
    for (var c in children) {
      gXml += '\t' + c.toXML() + '\n';
    }

    var xml =
        '<g ${attributes(id, fill, stroke, strokeWidth, strokeDasharray, style, transform, unit, visibility)} >'
        '$gXml'
        '</g>';

    return xml;
  }
}
