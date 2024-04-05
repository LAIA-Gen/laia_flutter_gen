class RiverpodGenAnnotation {
  final String getPath;
  final String createPath;
  final String updatePath;
  final String deletePath;
  final String getAllPath;
  final bool auth;


  const RiverpodGenAnnotation({ this.getAllPath = '', this.createPath = '', this.updatePath = '', this.deletePath = '', this.getPath = '', this.auth = false });
}
