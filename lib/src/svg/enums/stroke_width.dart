import 'package:scidart_plot/src/svg/enums/unit.dart';
import 'package:scidart_plot/src/svg/widgets/abstract/unit_converter.dart';

class StrokeWidth {
  double _value;

  StrokeWidth(double value) {
    _value = value;
  }

  static final none = StrokeWidth(-1);
  static final width1 = StrokeWidth(1.0);
  static final width2 = StrokeWidth(2.0);
  static final width5 = StrokeWidth(5.0);
  static final width10 = StrokeWidth(10.0);
  static final width20 = StrokeWidth(20.0);

  static StrokeWidth custom(double value) {
    return StrokeWidth(value);
  }

  static String toXml(StrokeWidth strokeWidth, Unit unit) {
    if (strokeWidth != null && strokeWidth._value >= 0) {
      return roundPixels(strokeWidth._value, unit);
    } else {
      return 'none';
    }
  }
}
