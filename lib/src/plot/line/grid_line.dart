import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/svg.dart';

SvgWidget grid_line(
    {@required Array ax,
    @required Array ay,
    @required double xStart,
    @required double xEnd,
    @required double yStart,
    @required double yEnd,
    @required double distDeltaX,
    @required double distDeltaY,
    @required frameGridStrokeColor,
    @required StrokeDasharray frameGridDasharray,
    @required frameAxisStrokeColor,
    @required textAxisStrokeColor,
    @required grid,
    id = 'grid'}) {
  // main widgets list
  var widgets = <SvgWidget>[];

  // draw X axis
  widgets.add(Line(
      x1: xStart, y1: yEnd, x2: xEnd, y2: yEnd, stroke: frameAxisStrokeColor));

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
            y1: yEnd,
            x2: xPoint,
            y2: yEnd + 10,
            stroke: frameAxisStrokeColor));
      }
    }
  } else {
    for (var i = 0; i < ax.length; i++) {
      var xPoint = calcXPoint(xStart, i, distDeltaX);
      widgets.add(Line(
          x1: xPoint,
          y1: yEnd,
          x2: xPoint,
          y2: yEnd + 10,
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
            y: yEnd + 20,
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
          y: yEnd + 20,
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
  } else if (delta < 5.0) {
    return i % 10 == 0;
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
