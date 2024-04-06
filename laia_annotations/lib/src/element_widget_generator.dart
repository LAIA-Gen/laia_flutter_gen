class ElementWidgetGen {
  final bool auth;
  const ElementWidgetGen({ this.auth = false});
}

class Field {
  final String widget;
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String relation;
  final bool uspaceMap;

  const Field({this.widget = '', this.fieldName = '', this.fieldDescription = '', this.editable = true, this.placeholder = '', this.relation = '', this.uspaceMap = false});
}