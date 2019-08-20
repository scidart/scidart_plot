class PointPair {
  double x;
  double y;

  String toXML() {
    return '${x}, ${y}';
  }

  @override
  String toString() {
    return toXML();
  }
}
