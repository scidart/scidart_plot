import 'package:scidart_plot/src/svg/svg.dart';

class LegendItem {
  String name;

  LegendItem(this.name);

  SvgWidget generate(double x, double y, Color lineColor, Color textColor,
      double lineLength, double marginLeftText) {
    return Group(id: 'legend item', children: [
      Line(x1: x, y1: y, x2: x + lineLength, y2: y, stroke: lineColor),
      Text(
          x: x + lineLength + marginLeftText,
          y: y,
          text: name,
          fill: textColor,
          alignmentY: AlignmentY.central,
          textAnchor: TextAnchor.start)
    ]);
  }
}
