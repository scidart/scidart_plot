import 'package:scidart_plot/src/svg/svg.dart';

/// Base abstract class to create a call pettern to all plots.
abstract class PlotBase {
  String? id;
  Color? fill;
  Color? stroke;
  StrokeWidth? strokeWidth;
  StrokeDasharray? strokeDasharray;
}
