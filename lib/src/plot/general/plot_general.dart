import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/general/plot_general_type.dart';
import 'package:scidart_plot/src/plot/widgets/plot_base.dart';
import 'package:scidart_plot/src/svg/svg.dart';

/// Base class to generate plot curves
///
/// # Constructors:
/// ```dart
/// PlotGeneral(
///       {required this.ay,
///       this.stroke,
///       this.fill,
///       this.strokeWidth,
///       this.strokeDasharray,
///       this.id = 'plot_line',
///       this.plotGeneralType = PlotGeneralType.Line});
/// ```
///
/// # References
/// 1. "How to make charts with svg". https://css-tricks.com/how-to-make-charts-with-svg/. Retrieved 2021-03-01.
/// 2. "Simple line chart". https://google.github.io/charts/flutter/example/line_charts/simple. Retrieved 2021-03-01.
///
/// # Examples
/// ```dart
/// var N = 0.1;
/// var n = linspace(0, N, num: 50, endpoint: false);
/// var f1 = 60.0;
/// var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
///
/// var line = PlotGeneral(ay: sg);
/// var plotExample = canvasGeneral(ax: n, lines: [line]);
///
/// print(plotExample.toXML())
///
/// /* output:
/// <?xml version="1.0" encoding="UTF-8" ?>
/// <svg width="414.0" height="318.0" xmlns="http://www.w3.org/2000/svg">
/// 	<text x="207.0px" y="15.0px" text-anchor="middle" font-size="25.0px" dy=".4em" id="none" fill="black" stroke="none" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" >Example plot</text>
/// 	<g id="lines" fill="none" stroke="none" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" >	<g id="plot_line" fill="none" stroke="none" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" >	<polyline points="60.0,164.0 66.9,78.9 73.8,40.0 80.6,68.3 87.5,148.4 94.4,237.0 101.3,286.0 108.2,268.9 115.0,194.9 121.9,104.1 128.8,45.8 135.7,51.6 142.6,118.3 149.4,209.7 156.3,276.4 163.2,282.2 170.1,223.9 177.0,133.1 183.8,59.1 190.7,42.0 197.6,91.0 204.5,179.6 211.4,259.7 218.2,288.0 225.1,249.1 232.0,164.0 238.9,78.9 245.8,40.0 252.6,68.3 259.5,148.4 266.4,237.0 273.3,286.0 280.2,268.9 287.0,194.9 293.9,104.1 300.8,45.8 307.7,51.6 314.6,118.3 321.4,209.7 328.3,276.4 335.2,282.2 342.1,223.9 349.0,133.1 355.8,59.1 362.7,42.0 369.6,91.0 376.5,179.6 383.4,259.7 390.2,288.0 397.1,249.1 " id="none" fill="none" stroke="#ff0000" stroke-width="none" stroke-dasharray="none" style="none" visibility="inherit" />
/// </g>
/// <!--	the SVG is too long to put here	-->
/// </svg>
/// */
/// ```
class PlotGeneral extends PlotBase {
  Array ay;
  PlotGeneralType plotGeneralType;

  @override
  String? id;
  @override
  Color? stroke;
  @override
  Color? fill;
  @override
  StrokeWidth? strokeWidth;
  @override
  StrokeDasharray? strokeDasharray;

  PlotGeneral(
      {required this.ay,
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
          var yPoint = scaleConversion(ay[i], yStart, yEnd, yMin, yMax);

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
          var yPoint = scaleConversion(ay[i], yStart, yEnd, yMin, yMax);

          widgets.add(Circle(
              cx: xPoint,
              cy: yPoint,
              r: strokeWidth?.getValue() ?? 2.0,
              stroke: stroke,
              fill: fill ?? stroke,
              strokeDasharray: strokeDasharray));
        }
        break;
      case PlotGeneralType.Stem:
        var middleY = yStart + ((yEnd - yStart) / 2);

        for (var i = 0; i < ax.length; i++) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          var yPoint = scaleConversion(ay[i], yStart, yEnd, yMin, yMax);

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
              r: strokeWidth?.getValue() ?? 2.0,
              stroke: stroke,
              fill: fill ?? stroke,
              strokeDasharray: strokeDasharray));
        }
        break;
      case PlotGeneralType.Bar:
        var middleY = yStart + ((yEnd - yStart) / 2);
        var width = strokeWidth?.getValue() ?? 2.0;

        for (var i = 0; i < ax.length; i++) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          var yPoint = scaleConversion(ay[i], yStart, yEnd, yMin, yMax);
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
