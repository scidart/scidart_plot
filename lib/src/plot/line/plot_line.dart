import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/svg.dart';

class PlotLine {
  Array ay;
  String id;
  Color color;
  StrokeDasharray strokeDasharray;

  PlotLine({@required Array ay,
        Color color,
    StrokeDasharray strokeDasharray,
        id = 'plot_line'}) {
      this.ay = ay;
      this.id = id;
      this.color = color ?? Color.hex('#ff0000');
      this.strokeDasharray = strokeDasharray;
  }

  SvgWidget generate(Array ax, double xStart, double xEnd, double yStart, double yEnd,
      double distDeltaX, double yMin, double yMax) {
    if (ax.length != ay.length) {
      throw FormatException('expected ax and ay to have same length');
    }

    // main widgets list
    var widgets = <SvgWidget>[];

    var points = <PointPair>[];
    for(var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      // http://www.pstcc.edu/nbs/WebPhysics/Chapter12.htm
      // (- yEnd + yPoint) / (yEnd - yStart) = (yMin - ay[i]) / (yMax - yMin)
      // (- yEnd + yPoint) = (yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin)
      //  yPoint = yEnd + ((yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin))
      var yPoint = yEnd + ((yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin));
      points.add(PointPair(x: xPoint, y: yPoint));
    }
    widgets.add(Polyline(points: points, stroke: color, strokeDasharray: strokeDasharray));

    return Group(id: id, children: widgets);
  }
}