import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/general/plot_general_type.dart';
import 'package:scidart_plot/src/plot/widgets/plot_base.dart';
import 'package:scidart_plot/src/svg/svg.dart';

class PlotGeneral extends PlotBase {
  Array ay;
  PlotGeneralType plotGeneralType;

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

  PlotGeneral(
      {@required this.ay,
      this.stroke,
      this.fill,
      this.strokeWidth,
      this.strokeDasharray,
      this.id = 'plot_line',
      this.plotGeneralType = PlotGeneralType.Line});

  SvgWidget generate(Array ax, double xStart, double xEnd, double yStart,
      double yEnd, double distDeltaX, double yMin, double yMax) {
    if (ax.length != ay.length) {
      throw FormatException('expected ax and ay to have same length');
    }

    stroke ??= Color.hex('#ff0000');

    // main widgets list
    var widgets = <SvgWidget>[];

    switch (plotGeneralType) {
      case PlotGeneralType.Line:
        var points = <PointPair>[];

        for (var i = 0; i < ax.length; i++) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          var yPoint =
              scaleConversion(ay[i], xStart, xEnd, yStart, yEnd, yMin, yMax);

          points.add(PointPair(x: xPoint, y: yPoint));
        }

        widgets.add(Polyline(
            points: points,
            stroke: stroke,
            fill: fill,
            strokeWidth: strokeWidth,
            strokeDasharray: strokeDasharray));
        break;
      case PlotGeneralType.Dot:
        for (var i = 0; i < ax.length; i++) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          var yPoint =
              scaleConversion(ay[i], xStart, xEnd, yStart, yEnd, yMin, yMax);

          widgets.add(Circle(
              cx: xPoint,
              cy: yPoint,
              r: strokeWidth != null ? strokeWidth.getValue() : 2.0,
              stroke: stroke,
              fill: fill ?? stroke,
              strokeDasharray: strokeDasharray));
        }
        break;
      case PlotGeneralType.Stem:
        var middleY = yStart + ((yEnd - yStart) / 2);

        for (var i = 0; i < ax.length; i++) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          var yPoint =
              scaleConversion(ay[i], xStart, xEnd, yStart, yEnd, yMin, yMax);

          widgets.add(Line(
              x1: xPoint,
              y1: yPoint,
              x2: xPoint,
              y2: middleY,
              strokeWidth: strokeWidth,
              stroke: stroke,
              strokeDasharray: strokeDasharray));
          widgets.add(Circle(
              cx: xPoint,
              cy: yPoint,
              r: strokeWidth != null ? strokeWidth.getValue() : 2.0,
              stroke: stroke,
              fill: fill ?? stroke,
              strokeDasharray: strokeDasharray));
        }
        break;
      case PlotGeneralType.Bar:
        var middleY = yStart + ((yEnd - yStart) / 2);
        var width = strokeWidth != null ? strokeWidth.getValue() : 2.0;

        for (var i = 0; i < ax.length; i++) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          var yPoint =
              scaleConversion(ay[i], xStart, xEnd, yStart, yEnd, yMin, yMax);
          var height = middleY - yPoint;

          if (height >= 0) {
            widgets.add(Rect(
                x: xPoint,
                y: yPoint,
                width: width,
                height: height,
                stroke: stroke,
                fill: fill ?? stroke,
                strokeDasharray: strokeDasharray));
          } else {
            widgets.add(Rect(
                x: xPoint,
                y: middleY,
                width: width,
                height: height.abs(),
                stroke: stroke,
                fill: fill ?? stroke,
                strokeDasharray: strokeDasharray));
          }
        }
        break;
    }

    return Group(id: id, children: widgets);
  }
}
