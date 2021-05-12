import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/plot/general/plot_general.dart';
import 'package:scidart_plot/src/svg/svg.dart';
import '../plot.dart';
import 'grid_general.dart';

/// Main class to create the canvas to draw a General type plot
/// - [ax] input data array to X axis points
/// - [lines] input data with Y axis points and curves styles (width, type, color, etc)
/// - [width] final svg width
/// - [height] final svg height
/// - [showGrid] generate a grid to the plot, default is true
/// - [backgroundColor] plot background color
/// - [title] plot tile
/// - [legend] plot legend object options
/// - [gridColor] plot grid color
/// - [axisColor] main axis color
/// - [axisTextColor] axis label text color
///
/// # Examples
/// ```dart
/// var N = 0.1;
/// var n = linspace(0, N, num: 50, endpoint: false);
/// var f1 = 60.0;
/// var sg = arraySin(arrayMultiplyToScalar(n, 2 * pi * f1));
///
/// var line1 = PlotGeneral(ay: sg);
/// var line2 = PlotGeneral(ay: arrayDivisionToScalar(sg, 1.5), plotGeneralType: PlotGeneralType.Dot, stroke: Color.blue);
/// var line3 = PlotGeneral(ay: arrayDivisionToScalar(sg, 2), plotGeneralType: PlotGeneralType.Stem, stroke: Color.green);
/// var line4 = PlotGeneral(ay: arrayDivisionToScalar(sg, 3), plotGeneralType: PlotGeneralType.Bar, stroke: Color.purple);
///
/// var legend1 = LegendItem('line 1');
/// var legend2 = LegendItem('line 2');
/// var legend3 = LegendItem('line 3');
/// var legend4 = LegendItem('line 4');
///
/// var plotExample = canvasGeneral(ax: n,
///   lines: [line1, line2, line3, line4],
///   title: 'Example plot',
///   legend: Legend([legend1, legend2, legend3, legend4], LegendPosition.topRight));
///
/// print(plotExample.toXML());
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
SvgCanvas canvasGeneral({
  @required final Array ax,
  @required final List<PlotGeneral> lines,
  final double width = 414.0,
  double height = 288.0,
  final bool showGrid = true,
  final Color backgroundColor,
  final String title,
  final Legend legend,
  final Color gridColor,
  final Color axisColor,
  final Color axisTextColor,
}) {
  // default margins
  final frameMarginLeft = 60.0;
  var frameMarginTop = 10.0;
  final frameMarginRight = 10.0;
  final frameMarginButton = 30.0;

  // adjustment to create plot title
  var titleWidget;
  if (title != null) {
    final titleMargin = 30.0;
    frameMarginTop += titleMargin;
    height += titleMargin;
    titleWidget = Text(
        x: width / 2,
        y: titleMargin / 2,
        text: title,
        fill: Color.black,
        textAnchor: TextAnchor.middle,
        alignmentY: AlignmentY.central,
        fontSize: FontSize.custom(25, Unit.px));
  }

  // create main canvas
  var plot = SvgCanvas(
      fill: backgroundColor, width: width, height: height, children: []);

  // title creation, if exist
  if (titleWidget != null) {
    plot.children.add(titleWidget);
  }

  // calculate the margin limits
  final xStart = frameMarginLeft;
  final xEnd = width - frameMarginRight;
  final yStart = frameMarginTop;
  final yEnd = height - frameMarginButton;

  // calculate X axis distribution
  final lengthX = xEnd - xStart;
  final distDeltaX = lengthX / ax.length;

  // detect the Y with bigger range as reference to generate Y axis scale
  var yMin = double.infinity;
  var yMax = double.negativeInfinity;
  for (var l in lines) {
    yMin = min(arrayMin(l.ay), yMin);
    yMax = max(arrayMax(l.ay), yMax);
  }

  // generate Y axis array
  var ay = linspace(yMin, yMax, num: ax.length);

  // calculate Y axis distribution
  final lengthY = yEnd - yStart;
  final distDeltaY = lengthY / ay.length;

  var plotGrid = grid_general(
    ax: ax,
    ay: ay,
    xStart: xStart,
    xEnd: xEnd,
    yStart: yStart,
    yEnd: yEnd,
    distDeltaX: distDeltaX,
    distDeltaY: distDeltaY,
    frameGridStrokeColor: gridColor ?? Color.gray,
    frameGridDasharray: StrokeDasharray.dash5,
    frameAxisStrokeColor: axisColor ?? Color.black,
    textAxisStrokeColor: axisTextColor ?? Color.black,
    grid: showGrid,
  );

  var linesSvg = <SvgWidget>[];
  for (var l in lines) {
    linesSvg.add(
        l.generate(ax, xStart, xEnd, yStart, yEnd, distDeltaX, yMin, yMax));
  }
  var linesGroup = Group(children: linesSvg, id: 'lines');

  plot.children.add(linesGroup);
  plot.children.add(plotGrid);

  // add legend to the plot
  if (legend != null) {
    plot.children.add(legend.generate(xStart, yStart, xEnd, yEnd, lines));
  }

  return plot;
}
