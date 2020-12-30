import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

class PlotLine {
  Array ay;
  String id;
  Color color;

  PlotLine({@required Array ay,
        Color color,
        id = 'plot_line'}) {
      this.ay = ay;
      this.id = id;
      this.color ??= Color.hex('#8ED1EC');
  }

  double _convertToPixel(double frameLength, double arrayDiff, double arrayPoint) {
    return ((arrayPoint * frameLength) / arrayDiff);
  }

  SvgWidget generateLine(Array ax, double width, double height,
      double frameMarginLeft, double frameMarginTop, double frameMarginButton, double ayArrayDiffMax) {
    if (ax.length != ay.length) {
      throw FormatException('expected ax and ay to have same length');
    }

    var axMin = arrayMin(ax);
    var axMax = arrayMax(ax);
    var axArrayDiff = axMax - axMin;
    final yStart = frameMarginTop;
    final yEnd = height - frameMarginButton;
    final lengthY = yEnd - yStart;

    // main widgets list
    var widgets = <SvgWidget>[];

    var points = <PointPair>[];
    for (var i = 0; i < ax.length; i++) {
      var x = frameMarginLeft + _convertToPixel(width, axArrayDiff, ax[i]);
      var y = lengthY - _convertToPixel(height, ayArrayDiffMax, ay[i]);
      var point = PointPair(x: x, y: y);
      points.add(point);
    }
    widgets.add(Polyline(points: points, stroke: color));

    return Group(id: id, children: widgets);
  }
}