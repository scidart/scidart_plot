import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';

class Rect implements SvgWidget {
  double x;
  double y;
  double width;
  double height;

  // override
  Color fill;
  double strokeWidth;
  Color stroke;
  String style;

  Rect({@required this.x,
    @required this.y,
    @required this.width,
    @required this.height,
    this.fill,
    this.strokeWidth,
    this.stroke,
    this.style});

  @override
  String toXML() {
    var xml =
        '<rect x="${x}" y="${y}" width="${width}" height="${height}" '
        'fill="${fill.toHexColor().toCssString()}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'style="${style}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
