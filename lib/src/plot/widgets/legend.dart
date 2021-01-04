import 'dart:math';

import 'package:scidart_plot/src/plot/line/plot_line.dart';
import 'package:scidart_plot/src/plot/widgets/legend_item.dart';
import 'package:scidart_plot/src/plot/widgets/legend_position.dart';
import 'package:scidart_plot/src/svg/svg.dart';

class Legend {
  List<LegendItem> items;
  Color backgroundColor = Color.white;
  Color textColor;
  LegendPosition position;

  Legend(this.items, this.position, {this.backgroundColor, this.textColor});

  SvgWidget generate(double xStart, double yStart, double xEnd, double yEnd, List<PlotLine> lines) {
    const marginTop = 15.0;
    const marginLeft = 5.0;
    const marginRight = 5.0;
    const lineLength = 10.0;

    // calculate the width based with the maximum string length
    const textLetterLength = 5.6;
    var maxLengthString = 0;
    for (var item in items) {
      maxLengthString = max(maxLengthString, item.name.length);
    }
    final textLength = textLetterLength * maxLengthString;

    const marginLeftText = 5.0;
    final legendWidth = marginLeftText + lineLength + marginLeftText + textLength + marginRight;
    final legendHeight = marginTop + marginTop * lines.length;

    // calculate x and y positions
    double x, y;
    switch(position) {
      case LegendPosition.topLeft:
        x = xStart;
        y = yStart;
        break;
      case LegendPosition.topRight:
        x = xEnd - legendWidth;
        y = yStart;
        break;
      case LegendPosition.bottomLeft:
        x = xStart;
        y = yEnd - legendHeight;
        break;
      case LegendPosition.bottomRight:
        x = xEnd - legendWidth;
        y = yEnd - legendHeight;
        break;
      case LegendPosition.center:
        x = xStart + ((xEnd - xStart)/2) - (legendWidth/2);
        y = yStart + ((yEnd-yStart)/2) - (legendHeight/2);
        break;
    }

    if (lines.length != items.length) {
      throw FormatException('expected legendItems and lines to have the same length');
    }

    var g = Group(id: 'legend', children: []);

    // create legend square
    g.children.add(Rect(x: x, y: y,
        width: legendWidth,
        height: legendHeight,
        fill: backgroundColor ?? Color.white));

    // create legend items
    for (var i = 0; i < lines.length; i++) {
      g.children.add(items[i].generate(x + marginLeft,
          y + marginTop + (i * marginTop),
          lines[i].color, textColor ?? Color.black,
          lineLength, marginLeftText));
    }

    return g;
  }
}