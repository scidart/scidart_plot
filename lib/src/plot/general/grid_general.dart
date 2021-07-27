import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/svg.dart';

/// Main class to create the canvas to draw a General type plot
/// - [ax] input data array to X axis points
/// - [ay] input data array to Y axis points
/// - [xStart] grid x start point
/// - [xEnd] grid x end point
/// - [yStart] grid y start point
/// - [yEnd] grid y end point
/// - [distDeltaX] x grid lines distance
/// - [distDeltaY] y grid lines distance
/// - [frameGridStrokeColor] grid line stroke color
/// - [frameGridDasharray] grid line stroke style
/// - [frameAxisStrokeColor] grid frame line stroke color
/// - [textAxisStrokeColor] text line stroke color
/// - [grid] enable or disable grid creation
/// - [id] grid svg id (optional)
///
/// # Examples
/// ```dart
/// var plotGrid = grid_general(
///     ax: ax,
///     ay: ay,
///     xStart: xStart,
///     xEnd: xEnd,
///     yStart: yStart,
///     yEnd: yEnd,
///     distDeltaX: distDeltaX,
///     distDeltaY: distDeltaY,
///     frameGridStrokeColor: gridColor ?? Color.gray,
///     frameGridDasharray: StrokeDasharray.dash5,
///     frameAxisStrokeColor: axisColor ?? Color.black,
///     textAxisStrokeColor: axisTextColor ?? Color.black,
///     grid: showGrid,
///   );
///
/// print(plotGrid.toXML());
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
SvgWidget grid_general(
    {required Array ax,
    required Array ay,
    required double xStart,
    required double xEnd,
    required double yStart,
    required double yEnd,
    required double distDeltaX,
    required double distDeltaY,
    required frameGridStrokeColor,
    required StrokeDasharray frameGridDasharray,
    required frameAxisStrokeColor,
    required textAxisStrokeColor,
    required grid,
    id = 'grid'}) {
  // main widgets list
  var widgets = <SvgWidget>[];

  // draw X axis
  var yMiddle = yStart + ((yEnd - yStart) / 2);
  widgets.add(Line(
      x1: xStart,
      y1: yMiddle,
      x2: xEnd,
      y2: yMiddle,
      stroke: frameAxisStrokeColor));

  // draw Y axis
  widgets.add(Line(
      x1: xStart,
      y1: yStart,
      x2: xStart,
      y2: yEnd,
      stroke: frameAxisStrokeColor));

  // draw X axis mark
  if (_deltaXThreshold(distDeltaX)) {
    for (var i = 0; i < ax.length; i++) {
      if (_deltaXSmallRule(i, distDeltaX)) {
        var xPoint = calcXPoint(xStart, i, distDeltaX);
        widgets.add(Line(
            x1: xPoint,
            y1: yMiddle,
            x2: xPoint,
            y2: yMiddle + 10,
            stroke: frameAxisStrokeColor));
      }
    }
  } else {
    for (var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      widgets.add(Line(
          x1: xPoint,
          y1: yMiddle,
          x2: xPoint,
          y2: yMiddle + 10,
          stroke: frameAxisStrokeColor));
    }
  }

  // draw Y axis mark
  if (_deltaYThreshold(distDeltaY)) {
    for (var i = 0; i < ay.length; i++) {
      if (_deltaYSmallRule(i, distDeltaY)) {
        var yPoint = calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Line(
            x1: xStart,
            y1: yPoint,
            x2: xStart - 10,
            y2: yPoint,
            stroke: frameAxisStrokeColor));
      }
    }
  } else {
    for (var i = 0; i < ay.length; i++) {
      var yPoint = calcYPoint(yEnd, i, distDeltaY);
      widgets.add(Line(
          x1: xStart,
          y1: yPoint,
          x2: xStart - 10,
          y2: yPoint,
          stroke: frameAxisStrokeColor));
    }
  }

  // draw X axis numbers
  if (_deltaXThreshold(distDeltaX)) {
    // if delta is too small, only draw the texts in even position to optimize the space
    for (var i = 0; i < ax.length; i++) {
      if (_deltaXSmallRule(i, distDeltaX)) {
        var xPoint = calcXPoint(xStart, i, distDeltaX);
        widgets.add(Text(
            x: xPoint,
            y: yMiddle + 20,
            text: truncate(ax[i], 4).toString().toString(),
            fill: textAxisStrokeColor,
            textAnchor: TextAnchor.middle));
      }
    }
  } else {
    for (var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      widgets.add(Text(
          x: xPoint,
          y: yMiddle + 20,
          text: truncate(ax[i], 4).toString().toString(),
          fill: textAxisStrokeColor,
          textAnchor: TextAnchor.middle));
    }
  }

  // draw Y axis numbers
  if (_deltaYThreshold(distDeltaY)) {
    // if delta is too small, only draw the texts in even position to optimize the space
    for (var i = 0; i < ay.length; i++) {
      if (_deltaYSmallRule(i, distDeltaY)) {
        var yPoint = calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Text(
            x: xStart - 10,
            y: yPoint,
            text: truncate(ay[i], 4).toString().toString(),
            fill: textAxisStrokeColor,
            textAnchor: TextAnchor.end,
            alignmentY: AlignmentY.central));
      }
    }
  } else {
    for (var i = 0; i < ay.length; i++) {
      var yPoint = calcYPoint(yEnd, i, distDeltaY);
      widgets.add(Text(
          x: xStart - 10,
          y: yPoint,
          text: truncate(ay[i], 4).toString().toString(),
          fill: textAxisStrokeColor,
          textAnchor: TextAnchor.end,
          alignmentY: AlignmentY.central));
    }
  }

  if (grid) {
    // the insertion always start with 1 to don't overlap the axis
    // draw X grid lines
    if (_deltaXThreshold(distDeltaX)) {
      // if delta is too small, only draw the texts in even position to optimize the space
      for (var i = 1; i < ax.length; i++) {
        if (_deltaXSmallRule(i, distDeltaX)) {
          var xPoint = calcXPoint(xStart, i, distDeltaX);
          widgets.add(Line(
              x1: xPoint,
              y1: yStart,
              x2: xPoint,
              y2: yEnd,
              stroke: frameGridStrokeColor,
              strokeDasharray: frameGridDasharray));
        }
      }
    } else {
      for (var i = 1; i < ax.length; i++) {
        var xPoint = calcXPoint(xStart, i, distDeltaX);
        widgets.add(Line(
            x1: xPoint,
            y1: yStart,
            x2: xPoint,
            y2: yEnd,
            stroke: frameGridStrokeColor,
            strokeDasharray: frameGridDasharray));
      }
    }

    // draw Y grid lines
    if (_deltaYThreshold(distDeltaY)) {
      // if delta is too small, only draw the texts in even position to optimize the space
      for (var i = 1; i < ay.length; i++) {
        if (_deltaYSmallRule(i, distDeltaY)) {
          var yPoint = calcYPoint(yEnd, i, distDeltaY);
          widgets.add(Line(
              x1: xStart,
              y1: yPoint,
              x2: xEnd,
              y2: yPoint,
              stroke: frameGridStrokeColor,
              strokeDasharray: frameGridDasharray));
        }
      }
    } else {
      for (var i = 1; i < ay.length; i++) {
        var yPoint = calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Line(
            x1: xStart,
            y1: yPoint,
            x2: xEnd,
            y2: yPoint,
            stroke: frameGridStrokeColor,
            strokeDasharray: frameGridDasharray));
      }
    }
  }

  return Group(id: id, children: widgets);
}

bool _deltaXSmallRule(int i, double delta) {
  if (delta < 1.0) {
    return i % 100 == 0;
  } else if (delta < 2.5) {
    return i % 50 == 0;
  } else if (delta < 5.0) {
    return i % 20 == 0;
  } else {
    return i % 10 == 0;
  }
}

bool _deltaYSmallRule(int i, double delta) {
  if (delta < 1.0) {
    return i % 100 == 0;
  } else if (delta < 5.0) {
    return i % 10 == 0;
  } else {
    return i % 1 == 0;
  }
}

bool _deltaXThreshold(double delta) {
  return delta < 10.0;
}

bool _deltaYThreshold(double delta) {
  return delta < 10.0;
}
