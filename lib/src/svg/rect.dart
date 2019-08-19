import 'package:meta/meta.dart';
import 'package:scidart_plot/src/svg/abstract/svg_widget.dart';

class Rect implements SvgWidget {
  double width;
  double height;
  String fill;
  double strokeWidth;
  String stroke;
  String style;

  Rect(
      {@required this.width,
      @required this.height,
      @required this.fill,
      @required this.strokeWidth,
      @required this.stroke,
      @required this.style});

  @override
  String toXML() {
    var xml =
        '<rect width="${width}" height="${height}" fill="${fill}" stroke-width="${strokeWidth}" stroke="${stroke}" />';
    return xml;
  }

  @override
  String toString() {
    return toXML();
  }
}
