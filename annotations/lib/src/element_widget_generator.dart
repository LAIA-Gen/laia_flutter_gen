class ElementWidgetGenAnnotation {
  const ElementWidgetGenAnnotation();
}

const elementWidgetGen = ElementWidgetGenAnnotation();

class Field {
  final String widget;
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;

  const Field({this.widget = '', this.fieldName = '', this.fieldDescription = '', this.editable = true, this.placeholder = ''});
}