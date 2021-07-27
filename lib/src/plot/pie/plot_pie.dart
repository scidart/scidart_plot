import 'package:scidart_plot/src/plot/widgets/plot_base.dart';
import 'package:scidart_plot/src/svg/svg.dart';

class PlotPie extends PlotBase {
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

  PlotPie(
      {required this.fill,
      this.stroke,
      this.strokeWidth,
      this.strokeDasharray,
      this.id = 'plot_pie'});

  SvgWidget generate(double xCenter, double yCenter, double radius,
      double startAngle, double endAngle) {
    return Arc(
        id: id,
        cx: xCenter,
        cy: yCenter,
        r: radius,
        startAngle: startAngle,
        endAngle: endAngle,
        stroke: stroke,
        fill: fill,
        strokeWidth: strokeWidth,
        strokeDasharray: strokeDasharray);
  }
}
