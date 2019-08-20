import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';

class Circle implements SvgWidget {
  double cx;
  double cy;
  double r;

  // override
  Color fill;
  Color stroke;
  double strokeWidth;
  String style;

  Circle({@required this.cx,
    @required this.cy,
    @required this.r,
    this.fill,
    this.stroke,
    this.strokeWidth,
    this.style});

  @override
  String toXML() {
    var xml =
        '<circle cx="${cx}" cy="${cy}" r="${r}" '
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
