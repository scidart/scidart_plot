enum AlignmentY { top, central, bottom}

extension AlignmentYExt on AlignmentY {
  String get xmlValue {
    switch (this) {
      case AlignmentY.top:
        return '-.4em';
      case AlignmentY.central:
        return '.4em';
      case AlignmentY.bottom:
        return '0em';
    }
    return '0em';
  }
}