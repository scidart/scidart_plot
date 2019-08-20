import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

class Text implements SvgWidget {
  double x;
  double y;
  String text;
  double rotate;

  //override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;

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
      this.transform});

  @override
  String toXML() {
    var xml = '<text x="${x}" y="${y}" '
        'id="${id}" '
        'fill="${fill.toHexColor().toCssString()}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'style="${style}" '
        'stroke-dasharray=${strokeDasharray} '
        'transform="${transform}; rotate(${rotate} ${x},${y})">${text}</text>';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
