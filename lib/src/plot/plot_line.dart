import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/scidart_plot.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/unit_converter.dart';

class PlotLine {
  Array ay;
  String id;
  Color color;

  PlotLine({@required Array ay,
        Color color,
        id = 'plot_line'}) {
      this.ay = ay;
      this.id = id;
      this.color ??= Color.hex('#ff0000');
  }

  SvgWidget generateLine(Array ax, double xStart, double xEnd, double yStart, double yEnd,
      double distDeltaX, double yMin, double yMax) {
    if (ax.length != ay.length) {
      throw FormatException('expected ax and ay to have same length');
    }

    // main widgets list
    var widgets = <SvgWidget>[];

    var points = <PointPair>[];
    for(var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      //var yPoint = calcYPoint(yEnd, i, distDeltaY);
      // ymin ------- yEnd
      // ymax ------- yStart
      // lengthY / distDeltaY
      // yi - ymin / ymax - ymin = yo - min / max - min
      // yi = (yminx - ymin) * (y0 - min) / (max - min) + ymin
      var yPoint = ((yEnd - yStart) * (ay[i] + yMin) / (yMax - yMin)) + yEnd;
      points.add(PointPair(x: xPoint, y: yPoint));
    }
    widgets.add(Polyline(points: points, stroke: color));

    return Group(id: id, children: widgets);
  }
}