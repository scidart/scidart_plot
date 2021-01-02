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
  static final dash5dash1 = StrokeDasharray('5,1');

  static StrokeDasharray custom(String value) {
    return StrokeDasharray(value);
  }

  String get xmlValue => _value;

  static String toXml(StrokeDasharray strokeDasharray) {
    return strokeDasharray != null ? strokeDasharray.xmlValue : StrokeDasharray.none.xmlValue;
  }
}