class StrokeDasharray {
  String _value;

  StrokeDasharray(String value) {
    _value = value;
  }

  static final none = StrokeDasharray('none');
  static final dash1 = StrokeDasharray('1,1');
  static final dash2 = StrokeDasharray('2,2');
  static final dash5 = StrokeDasharray('5,5');
  static final dash10 = StrokeDasharray('10,10');
  static final dash20 = StrokeDasharray('20,20');
  static final dash5dash1 = StrokeDasharray('5,2,1,2');

  static StrokeDasharray custom(String value) {
    return StrokeDasharray(value);
  }

  static String toXml(StrokeDasharray strokeDasharray) {
    return strokeDasharray != null ? strokeDasharray._value : StrokeDasharray.none._value;
  }
}