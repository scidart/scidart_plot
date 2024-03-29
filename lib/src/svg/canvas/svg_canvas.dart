import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/enums/color.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/unit_converter.dart';

/// Main class that handle and generate SVG widgets, can be interpreted like a canvas
class SvgCanvas {
  List<SvgWidget> children;
  double width;
  double height;
  Color? fill;

  // private attributes
  final String _xmlns = 'http://www.w3.org/2000/svg';

  /// Generate a SVG structure
  /// [width] width of SVG
  /// [height] height of SVG
  /// [children] three with SVG elements
  SvgCanvas(
      {required this.width,
      required this.height,
      required this.children,
      this.fill});

  /// Convert the Svg structure to XML string
  String toXML() {
    var xml = '<?xml version="1.0" encoding="UTF-8" ?>\n'
        '<svg width="${roundPixelsOnly(width)}" height="${roundPixelsOnly(height)}" xmlns="$_xmlns">\n';
    if (fill != null) {
      children.insert(
          0,
          Rect(
              x: 0, y: 0, width: 100, height: 100, unit: Unit.per, fill: fill));
    }
    for (var c in children) {
      xml += '\t' + c.toXML() + '\n';
    }
    xml += '</svg>';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
