import 'package:meta/meta.dart';
import 'package:scidart_io/scidart_io.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

/// Main class that handle and generate SVG widgets, can be interpreted like a canvas
class Svg {
  List<SvgWidget> children;
  double width;
  double height;

  // private attributes
  String _xmlns = "http://www.w3.org/2000/svg";

  //  String _xmlnsXlink = "http://www.w3.org/1999/xlink";
  // xmlns:xlink="${_xmlnsXlink}"

  /// Generate a SVG structure
  /// [width] width of SVG
  /// [height] height of SVG
  /// [children] three with SVG elements
  Svg({@required this.width, @required this.height, @required this.children});

  /// Convert the Svg structure to XML string
  String toXML() {
    var xml =
        '<?xml version="1.0" encoding="UTF-8" ?>\n'
        '<svg width="${width}" height="${height}" xmlns="${_xmlns}">\n';
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

  /// Save the SVG in a file
  /// [fileName] the file name, if extension '.svg' is not informed,
  /// it is added automatically
  void save(String fileName) async {
    const extension = '.svg';
    if (!fileName.toLowerCase().endsWith(extension)) {
      fileName += extension;
    }
    await writeTxt(toXML(), fileName);
  }
}
