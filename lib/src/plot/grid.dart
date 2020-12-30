import 'package:meta/meta.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/svg_widget.dart';

import '../../scidart_plot.dart';

SvgWidget grid({@required double width,
  @required double height,
  @required Array ax,
  @required Array ay,
  @required double frameMarginLeft,
  @required double frameMarginTop,
  @required double frameMarginRight,
  @required double frameMarginButton,
  @required frameGridStrokeColor,
  @required frameGridDasharray,
  @required frameAxisStrokeColor,
  @required grid,
  id = 'grid'}) {

  // calculate the margin limits
  final xStart = frameMarginLeft;
  final xEnd = width - frameMarginRight;
  final yStart = frameMarginTop;
  final yEnd = height - frameMarginButton;

  // calculate X axis distribution
  final lengthX = xEnd - xStart;
  final distDeltaX = lengthX / ax.length;

  // calculate Y axis distribution
  final lengthY = yEnd - yStart;
  final distDeltaY = lengthY / ay.length;

  // main widgets list
  var widgets = <SvgWidget>[];

  // draw X axis
  widgets.add(Line(
      x1: xStart,
      y1: yEnd,
      x2: xEnd,
      y2: yEnd,
      stroke: frameAxisStrokeColor));

  // draw Y axis
  widgets.add(Line(
      x1: xStart,
      y1: yStart,
      x2: xStart,
      y2: yEnd,
      stroke: frameAxisStrokeColor));

  // draw X axis marx
  for(var i = 0; i < ax.length; i++) {
    var xPoint = _calcXPoint(xStart, i, distDeltaX);
    widgets.add(Line(
        x1:  xPoint,
        y1: yEnd,
        x2: xPoint,
        y2: yEnd + 10,
        stroke: frameAxisStrokeColor
    ));
  }

  // draw Y axis mark
  for(var i = 0; i < ay.length; i++) {
    var yPoint = _calcYPoint(yEnd, i, distDeltaY);
    widgets.add(Line(
        x1:  xStart,
        y1: yPoint,
        x2: xStart - 10,
        y2: yPoint,
        stroke: frameAxisStrokeColor
    ));
  }

  // draw X axis numbers
  if(distDeltaX < 10.0) {
    // if delta is too small, only draw the texts in even position to optimize the space
    for(var i = 0; i < ax.length; i++) {
      if (i.isEven) {
        var xPoint = _calcXPoint(xStart, i, distDeltaX);
        widgets.add(Text(x: xPoint,
            y: yEnd + 10,
            text: truncate(ax[i], 4).toString().toString(),
            fill: frameAxisStrokeColor));
      }
    }
  } else {
    for(var i = 0; i < ax.length; i++) {
      var xPoint = _calcXPoint(xStart, i, distDeltaX);
      widgets.add(Text(x: xPoint,
          y: yEnd + 10,
          text: truncate(ax[i], 4).toString().toString(),
          fill: frameAxisStrokeColor));
    }
  }
    
  // draw Y axis numbers
  if(distDeltaY < 10.0) {
    // if delta is too small, only draw the texts in even position to optimize the space
    for(var i = 0; i < ay.length; i++) {
      if (i.isEven) {
        var yPoint = _calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Text(x: xStart,
            y: yPoint,
            text: truncate(ay[i], 4).toString().toString(),
            fill: frameAxisStrokeColor));
      }
    }
  } else {
    for(var i = 0; i < ay.length; i++) {
      var yPoint = _calcYPoint(yEnd, i, distDeltaY);
      widgets.add(Text(x: 0,
          y: yPoint,
          text: truncate(ay[i], 4).toString().toString(),
          fill: frameAxisStrokeColor));
    }
  }

  if (grid) {
    // the insertion always start with 1 to don't overlap the axis
    // draw X grid lines
    if(distDeltaX < 10.0) {
      // if delta is too small, only draw the texts in even position to optimize the space
      for (var i = 1; i < ax.length; i++) {
        if (i.isEven) {
          var xPoint = _calcXPoint(xStart, i, distDeltaX);
          widgets.add(Line(
              x1: xPoint,
              y1: yStart,
              x2: xPoint,
              y2: yEnd,
              stroke: frameGridStrokeColor,
              strokeDasharray: frameGridDasharray
          ));
        }
      }
    } else {
      for (var i = 1; i < ax.length; i++) {
        var xPoint = _calcXPoint(xStart, i, distDeltaX);
        widgets.add(Line(
            x1: xPoint,
            y1: yStart,
            x2: xPoint,
            y2: yEnd,
            stroke: frameGridStrokeColor,
            strokeDasharray: frameGridDasharray
        ));
      }
    }

    // draw Y grid lines
    if(distDeltaY < 10.0) {
      // if delta is too small, only draw the texts in even position to optimize the space
      for (var i = 1; i < ay.length; i++) {
        if (i.isEven) {
          var yPoint = _calcYPoint(yEnd, i, distDeltaY);
          widgets.add(Line(
              x1: xStart,
              y1: yPoint,
              x2: xEnd,
              y2: yPoint,
              stroke: frameGridStrokeColor,
              strokeDasharray: frameGridDasharray
          ));
        }
      }
    } else {
      for (var i = 1; i < ay.length; i++) {
        var yPoint = _calcYPoint(yEnd, i, distDeltaY);
        widgets.add(Line(
            x1: xStart,
            y1: yPoint,
            x2: xEnd,
            y2: yPoint,
            stroke: frameGridStrokeColor,
            strokeDasharray: frameGridDasharray
        ));
      }
    }
  }

  return Group(id: id, children: widgets);
}

double _calcXPoint(double xStart, int i, double distDeltaX) {
  return xStart + (i * distDeltaX);
}

double _calcYPoint(double yEnd, int i, double distDeltaY) {
  return yEnd - (i * distDeltaY);
}