enum AlignmentY { top, central, bottom }

extension AlignmentYExt on AlignmentY {
  String get xmlValue {
    switch (this) {
      case AlignmentY.top:
        return '0.7em';
      case AlignmentY.central:
        return '.4em';
      case AlignmentY.bottom:
        return '0em';
    }
  }
}
