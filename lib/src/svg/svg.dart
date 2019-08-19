import 'package:meta/meta.dart';

import 'abstract/svg_widget.dart';

class Svg {
  List<SvgWidget> children;
  double width;
  double height;
  String _xmlns = "http://www.w3.org/2000/svg";
  String _xmlnsXlink = "http://www.w3.org/1999/xlink";

  Svg({@required this.width, @required this.height, @required this.children});

  @override
  String toXML() {
    var xml =
        '''<?xml version="1.0" encoding="UTF-8" ?>\n<svg width="${width}" height="${height}" xmlns="${_xmlns}"> xmlns:xlink="${_xmlnsXlink}"\n''';
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
