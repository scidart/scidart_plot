import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/widgets/plot_base.dart';
import 'package:scidart_plot/src/svg/svg.dart';

class PlotLine extends PlotBase {
  Array ay;

  @override
  String id;
  @override
  Color stroke;
  @override
  Color fill;
  @override
  StrokeWidth strokeWidth;
  @override
  StrokeDasharray strokeDasharray;

  PlotLine(
      {@required this.ay,
      this.stroke,
      this.fill,
      this.strokeWidth,
      this.strokeDasharray,
      this.id = 'plot_line'});

  SvgWidget generate(Array ax, double xStart, double xEnd, double yStart,
      double yEnd, double distDeltaX, double yMin, double yMax) {
    if (ax.length != ay.length) {
      throw FormatException('expected ax and ay to have same length');
    }

    // main widgets list
    var widgets = <SvgWidget>[];

    var points = <PointPair>[];
    for (var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      // http://www.pstcc.edu/nbs/WebPhysics/Chapter12.htm
      // (- yEnd + yPoint) / (yEnd - yStart) = (yMin - ay[i]) / (yMax - yMin)
      // (- yEnd + yPoint) = (yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin)
      //  yPoint = yEnd + ((yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin))
      var yPoint = yEnd + ((yEnd - yStart) * (yMin - ay[i]) / (yMax - yMin));
      points.add(PointPair(x: xPoint, y: yPoint));
    }

    stroke ??= Color.hex('#ff0000');

    widgets.add(Polyline(
        points: points,
        stroke: stroke,
        fill: fill,
        strokeWidth: strokeWidth,
        strokeDasharray: strokeDasharray));

    return Group(id: id, children: widgets);
  }
}
