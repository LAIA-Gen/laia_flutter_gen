class ElementTab {
  final String label;
  final List<String> fields;
  final String relation;
  final String inverseRelationField;
  final Map<String, dynamic> filters;
  const ElementTab({required this.label, this.fields = const [], this.relation = '', this.inverseRelationField = '', this.filters = const {}});
}

class ElementWidgetGen {
  final bool auth;
  final List<List<String>> defaultFieldsDetail;
  final List<ElementTab> tabs;
  const ElementWidgetGen({this.auth = false, this.defaultFieldsDetail = const [], this.tabs = const []});
}

class Field {
  final String widget;
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String relation;
  final bool uspaceMap;
  final String format;
  final String inverseRelationField;
  final String nicename;

  const Field({this.widget = '', this.fieldName = '', this.fieldDescription = '', this.editable = true, this.placeholder = '', this.relation = '', this.uspaceMap = false, this.format = '', this.inverseRelationField = '', this.nicename = ''});
}