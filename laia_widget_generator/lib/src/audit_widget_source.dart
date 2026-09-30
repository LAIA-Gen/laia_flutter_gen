// Read-only audit UI emitted into model libraries by the widget generator.
bool isAuditModel(String name) => name == 'AuditLog' || name == 'LoginEvent';

String generateAuditWidgets(String model) {
  if (!isAuditModel(model)) throw ArgumentError.value(model, 'model');
  return _auditWidgets.replaceAll('MODEL_NAME', model);
}

const _auditWidgets = r'''

class _LaiaAuditApi {
  _LaiaAuditApi(this.baseUrl, this.client, this.headers);
  final String baseUrl;
  final http.Client client;
  final Future<Map<String, String>> Function() headers;

  Future<Map<String, dynamic>> search(String model, int page, String field,
      bool ascending, Map<String, dynamic> filters, {int size = 20}) async {
    final response = await client.post(
      Uri.parse('$baseUrl/${model.toLowerCase()}s/').replace(queryParameters: {
        'skip': '${page * size}', 'limit': '$size',
      }),
      headers: await headers(),
      body: jsonEncode({'filters': filters, 'orders': {field: ascending ? 1 : -1, '_id': 1}}),
    );
    if (response.statusCode == 401 || response.statusCode == 403) {
      throw const _LaiaAuditAccessDenied();
    }
    if (response.statusCode != 200) { throw Exception('No se pudieron cargar los registros (${response.statusCode}).'); }
    return Map<String, dynamic>.from(jsonDecode(response.body) as Map);
  }
}

class _LaiaAuditAccessDenied implements Exception {
  const _LaiaAuditAccessDenied();
}

class _LaiaAuditMenu extends StatefulWidget {
  const _LaiaAuditMenu({super.key, required this.api, this.models = const ['AuditLog', 'LoginEvent']});
  final _LaiaAuditApi api;
  final List<String> models;
  @override
  State<_LaiaAuditMenu> createState() => __LaiaAuditMenuState();
}

class __LaiaAuditMenuState extends State<_LaiaAuditMenu> {
  late Future<bool> access;
  @override
  void initState() { super.initState(); access = checkAccess(); }
  Future<bool> checkAccess() async {
    try {
      await widget.api.search(widget.models.first, 0, 'createdAt', false, {}, size: 1);
      return true;
    } on _LaiaAuditAccessDenied { return false; }
  }
  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
    future: access,
    builder: (context, state) {
      if (state.hasError) {
        return TextButton.icon(onPressed: () => setState(() { access = checkAccess(); }),
          icon: const Icon(Icons.refresh), label: const Text('Reintentar acceso a auditoría'));
      }
      if (state.data != true) return const SizedBox.shrink();
      return Padding(padding: const EdgeInsets.all(12), child: Wrap(spacing: 16, runSpacing: 8,
        children: [for (final model in widget.models) OutlinedButton.icon(
          icon: Icon(model == 'AuditLog' ? Icons.history : Icons.login),
          label: Text(model),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (_) => _LaiaAuditLogPage(api: widget.api, model: model))),
        )],
      ));
    },
  );
}

class _LaiaAuditLogPage extends StatefulWidget {
  const _LaiaAuditLogPage({super.key, required this.api, required this.model});
  final _LaiaAuditApi api;
  final String model;
  @override
  State<_LaiaAuditLogPage> createState() => __LaiaAuditLogPageState();
}

class __LaiaAuditLogPageState extends State<_LaiaAuditLogPage> {
  final query = TextEditingController();
  int page = 0;
  int sortColumn = 0;
  bool ascending = false;
  late String filterField;
  Map<String, dynamic> filters = {};
  late Future<Map<String, dynamic>> result;
  bool get isAudit => widget.model == 'AuditLog';
  List<String> get fields => isAudit
      ? ['createdAt', 'action', 'model', 'resource_id', 'user.id', 'result.status_code', 'result.success']
      : ['createdAt', 'userId', 'ipAddress', 'userAgent'];
  List<String> get labels => isAudit
      ? ['Fecha', 'Acción', 'Modelo', 'Recurso', 'Usuario', 'HTTP', 'Correcto']
      : ['Fecha', 'Usuario', 'IP', 'Navegador'];
  Map<String, String> get filterOptions => isAudit
      ? {'action': 'Acción', 'model': 'Modelo', 'user.id': 'ID de usuario', 'resource_id': 'ID de recurso', 'metadata.request_id': 'ID de petición'}
      : {'userId': 'ID de usuario', 'ipAddress': 'IP', 'userAgent': 'Navegador'};
  @override
  void initState() {
    super.initState();
    filterField = filterOptions.keys.first;
    load();
  }
  void load() {
    result = widget.api.search(widget.model, page, fields[sortColumn], ascending, filters);
  }
  void reload({bool reset = false}) => setState(() { if (reset) page = 0; load(); });
  @override
  void dispose() { query.dispose(); super.dispose(); }

  dynamic value(Map<String, dynamic> row, String path) {
    dynamic current = row;
    for (final part in path.split('.')) { current = current is Map ? current[part] : null; }
    return current;
  }
  String text(dynamic item) {
    if (item == null) return '—';
    if (item is Map || item is List) return jsonEncode(item);
    if (item is bool) return item ? 'Sí' : 'No';
    return item.toString();
  }
  String cell(Map<String, dynamic> row, String field) {
    final item = value(row, field);
    if (field == 'createdAt' && item is String) {
      final date = DateTime.tryParse(item)?.toLocal();
      if (date != null) return date.toString();
    }
    return text(item);
  }
  void detail(Map<String, dynamic> row) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => Scaffold(
      appBar: AppBar(title: Text('${widget.model} · Detalle')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const Text('Solo lectura', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        for (final entry in row.entries) Padding(padding: const EdgeInsets.only(bottom: 20), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(entry.key, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            SelectableText(entry.value is Map || entry.value is List
              ? const JsonEncoder.withIndent('  ').convert(entry.value) : text(entry.value)),
          ],
        )),
      ]),
    )));
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(widget.model), actions: [
      IconButton(tooltip: 'Actualizar', onPressed: () => reload(), icon: const Icon(Icons.refresh)),
    ]),
    body: Column(children: [
      Padding(padding: const EdgeInsets.all(16), child: Wrap(spacing: 12, runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center, children: [
          DropdownButton<String>(value: filterField,
            items: filterOptions.entries.map((e) => DropdownMenuItem(value: e.key, child: Text(e.value))).toList(),
            onChanged: (field) => setState(() { filterField = field!; })),
          SizedBox(width: 260, child: TextField(controller: query,
            decoration: const InputDecoration(labelText: 'Valor exacto', border: OutlineInputBorder()),
            onSubmitted: (_) { filters = query.text.trim().isEmpty ? {} : {filterField: query.text.trim()}; reload(reset: true); })),
          FilledButton(onPressed: () { filters = query.text.trim().isEmpty ? {} : {filterField: query.text.trim()}; reload(reset: true); }, child: const Text('Filtrar')),
          TextButton(onPressed: () { query.clear(); filters = {}; reload(reset: true); }, child: const Text('Limpiar')),
          const Text('Solo lectura · Fechas en hora local'),
        ])),
      Expanded(child: FutureBuilder<Map<String, dynamic>>(future: result, builder: (context, state) {
        if (state.connectionState != ConnectionState.done) { return const Center(child: CircularProgressIndicator()); }
        if (state.hasError) { return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(state.error is _LaiaAuditAccessDenied ? 'Solo los administradores pueden consultar estos registros.' : 'No se pudieron cargar los registros.'),
          TextButton(onPressed: () => reload(), child: const Text('Reintentar')),
        ])); }
        final data = state.data!;
        final rows = (data['items'] as List).map((e) => Map<String, dynamic>.from(e as Map)).toList();
        final pages = (data['max_pages'] as num?)?.toInt() ?? 0;
        return Column(children: [
          Expanded(child: rows.isEmpty ? const Center(child: Text('No hay registros para estos filtros.')) :
            SingleChildScrollView(child: SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: DataTable(sortColumnIndex: sortColumn, sortAscending: ascending,
                columns: [for (var i = 0; i < fields.length; i++) DataColumn(label: Text(labels[i]),
                  onSort: (index, asc) { sortColumn = index; ascending = asc; reload(reset: true); }),
                  const DataColumn(label: Text('Detalle'))],
                rows: rows.map((row) => DataRow(cells: [
                  for (final field in fields) DataCell(ConstrainedBox(constraints: const BoxConstraints(maxWidth: 260),
                    child: Text(cell(row, field), maxLines: 2, overflow: TextOverflow.ellipsis)), onTap: () => detail(row)),
                  DataCell(IconButton(tooltip: 'Ver detalle', icon: const Icon(Icons.visibility_outlined), onPressed: () => detail(row))),
                ])).toList(),
              ),
            )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(tooltip: 'Anterior', onPressed: page > 0 ? () { page--; reload(); } : null, icon: const Icon(Icons.chevron_left)),
            Text(pages == 0 ? '0 registros' : 'Página ${page + 1} de $pages'),
            IconButton(tooltip: 'Siguiente', onPressed: page + 1 < pages ? () { page++; reload(); } : null, icon: const Icon(Icons.chevron_right)),
          ]),
        ]);
      })),
    ]),
  );
}
class _LaiaAuditEntry extends StatefulWidget {
  const _LaiaAuditEntry({required this.menu});
  final bool menu;
  @override
  State<_LaiaAuditEntry> createState() => _LaiaAuditEntryState();
}
class _LaiaAuditEntryState extends State<_LaiaAuditEntry> {
  late final http.Client client = http.Client();
  late final _LaiaAuditApi api = _LaiaAuditApi(baseURL, client, getHeaders);
  @override
  void dispose() { client.close(); super.dispose(); }
  @override
  Widget build(BuildContext context) => widget.menu
      ? _LaiaAuditMenu(api: api, models: const ['MODEL_NAME'])
      : _LaiaAuditLogPage(api: api, model: 'MODEL_NAME');
}
class MODEL_NAMEListView extends StatelessWidget {
  const MODEL_NAMEListView({super.key});
  @override
  Widget build(BuildContext context) => const _LaiaAuditEntry(menu: false);
}
class MODEL_NAMEAuditMenu extends StatelessWidget {
  const MODEL_NAMEAuditMenu({super.key});
  @override
  Widget build(BuildContext context) => const _LaiaAuditEntry(menu: true);
}

''';
