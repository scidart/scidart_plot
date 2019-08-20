import 'package:color/color.dart';
import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

class Rect implements SvgWidget {
  double x;
  double y;
  double width;
  double height;

  // override
  String id;
  Color fill;
  Color stroke;
  double strokeWidth;
  String strokeDasharray;
  String style;
  String transform;

  Rect({@required this.x,
    @required this.y,
    @required this.width,
    @required this.height,
    this.id,
    this.fill,
    this.stroke,
    this.strokeWidth,
    this.strokeDasharray,
    this.style,
    this.transform});

  @override
  String toXML() {
    var xml = '<rect x="${x}" y="${y}" width="${width}" height="${height}" '
        'id="${id}" '
        'fill="${fill.toHexColor().toCssString()}" '
        'stroke="${stroke.toHexColor().toCssString()}" '
        'stroke-width="${strokeWidth}" '
        'stroke-dasharray=${strokeDasharray} '
        'style="${style}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
