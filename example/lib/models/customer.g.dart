// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CustomerCWProxy {
  Customer email(String email);

  Customer id(String id);

  Customer name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Customer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Customer(...).copyWith(id: 12, name: "My name")
  /// ````
  Customer call({
    String? email,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCustomer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCustomer.copyWith.fieldName(...)`
class _$CustomerCWProxyImpl implements _$CustomerCWProxy {
  final Customer _value;

  const _$CustomerCWProxyImpl(this._value);

  @override
  Customer email(String email) => this(email: email);

  @override
  Customer id(String id) => this(id: id);

  @override
  Customer name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Customer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Customer(...).copyWith(id: 12, name: "My name")
  /// ````
  Customer call({
    Object? email = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Customer(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $CustomerCopyWith on Customer {
  /// Returns a callable class that can be used as follows: `instanceOfCustomer.copyWith(...)` or like so:`instanceOfCustomer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CustomerCWProxy get copyWith => _$CustomerCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class CustomerWidget extends StatefulWidget {
  final Customer? element;
  final bool isEditing;

  const CustomerWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _CustomerWidgetState createState() => _CustomerWidgetState();
}

class _CustomerWidgetState extends State<CustomerWidget> {
  final GlobalKey<StringWidgetState> emailWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: emailWidgetKey,
              fieldName: "email",
              fieldDescription: "This is the email",
              editable: true,
              placeholder: "Type the email",
              value: widget.element?.email,
            ),
            StringWidget(
              key: idWidgetKey,
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: true,
              placeholder: "Type the id",
              value: widget.element?.id,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element?.name,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedemail = emailWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          Customer updatedCustomer = widget.element ??
              Customer(
                email: updatedemail ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedCustomer = updatedCustomer.copyWith(
              email: updatedemail, id: updatedid, name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateCustomerProvider(updatedCustomer));
              print('Customer updated successfully');
            } else {
              await container.read(createCustomerProvider(updatedCustomer));
              print('Customer created successfully');
            }
          } catch (error) {
            print('Failed to update Customer: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class CustomerFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const CustomerFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  CustomerFieldWidgetState createState() => CustomerFieldWidgetState();
}

class CustomerFieldWidgetState extends State<CustomerFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Customer> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Customer customer =
        await container.read(getCustomerProvider(widget.value!).future);
    _typeAheadController.text = '${customer.name} <id: ${customer.id}>';
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  var container = ProviderContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Styles.secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.fieldName}:",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.fieldDescription,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.editable
                      ? Expanded(
                          child: TypeAheadField<Customer>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final customerPaginationData = await container
                                  .read(getAllCustomerProvider(container
                                          .read(customerPaginationProvider))
                                      .future);
                              final options = customerPaginationData.items;
                              return options
                                  .where((customer) =>
                                      customer.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      customer.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, customer) {
                              return ListTile(
                                title: Text(
                                    '${customer.name} <id: ${customer.id}>'),
                              );
                            },
                            onSelected: (Customer value) {
                              setState(() {
                                isValueChanged = value.id != initialValue;
                                currentValue = value.id;
                                _typeAheadController.text =
                                    '${value.name} <id: ${value.id}>';
                              });
                            },
                          ),
                        )
                      : Text(widget.value ?? widget.placeholder),
                ],
              ),
            ],
          ),
        ),
        if (isValueChanged)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
            ),
          ),
        Positioned(
          top: 0,
          right: 0,
          child: ElevatedButton(
            onPressed: () async {
              try {
                Customer customer = await container
                    .read(getCustomerProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CustomerWidget(element: customer, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch customer: $error');
              }
            },
            child: const Text('View Customer'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class CustomerHomeWidget extends StatelessWidget {
  const CustomerHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerListView()),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Styles.dashboardBlock,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/customer.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Customer",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      email: json['email'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class CustomerListView extends ConsumerWidget {
  const CustomerListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(customerPaginationProvider);
    final customersAsyncValue =
        ref.watch(getAllCustomerProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(customerPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(customerPaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(customerPaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      fieldsFilterStates[fieldName] = filterValue;
      ref
          .read(customerPaginationProvider.notifier)
          .setFilters(fieldsFilterStates);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (fieldsFilterStates.containsKey(fieldName)) {
        fieldsFilterStates.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Customer List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomerWidget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: customersAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (CustomerPaginationData data) {
            final customers = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'email': 'String',
                      'id': 'String',
                      'name': 'String'
                    },
                    filters: fieldsFilterStates,
                    onFilterChanged: onFilter,
                    onFilterRemove: onFilterRemove,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                  columns: [
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'email',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['email'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['email'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('email') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('email')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'id',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['id'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['id'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('id') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('id')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['name'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['name'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('name') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('name')},
                                    ),
                                  ],
                                  rows: customers.map((customer) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(
                                                customer.email.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(customer.id.toString()))),
                                        DataCell(Center(
                                            child: Text(
                                                customer.name.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomerWidget(
                                                      element: customer,
                                                      isEditing: true)),
                                        );
                                      },
                                    );
                                  }).toList(),
                                  showCheckboxColumn: false,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomPagination(
                    currentPage: data.currentPage,
                    maxPages: data.maxPages,
                    onPageSelected: (pageNumber) => _onPageButtonPressed(
                        pageNumber, ref, paginationState, data.maxPages),
                  )
                ]);
          },
        ));
  }

  void _onPageButtonPressed(int pageNumber, WidgetRef ref,
      CustomerPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(customerPaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class CustomerPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  CustomerPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class CustomerPaginationNotifier
    extends StateNotifier<CustomerPaginationState> {
  CustomerPaginationNotifier()
      : super(CustomerPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = CustomerPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = CustomerPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = CustomerPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: state.orders,
      filters: newFilters,
    );
  }

  Map<String, int> getOrders() {
    return state.orders;
  }

  Map<String, dynamic> getFilters() {
    return state.filters;
  }
}

final customerPaginationProvider =
    StateNotifierProvider<CustomerPaginationNotifier, CustomerPaginationState>(
  (ref) => CustomerPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getCustomerProvider = FutureProvider.autoDispose
    .family<Customer, String>((ref, customerId) async {
  final json = await http.get(Uri.parse('$baseURL/customer/$customerId'));
  final jsonData = jsonDecode(json.body);
  return Customer.fromJson(jsonData);
});

final createCustomerProvider = FutureProvider.autoDispose
    .family<void, Customer>((ref, customerInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/customer'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(customerInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Customer');
  }
});

final updateCustomerProvider = FutureProvider.autoDispose
    .family<void, Customer>((ref, customerInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/customer/${customerInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(customerInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Customer');
  }
});

final deleteCustomerProvider =
    FutureProvider.autoDispose.family<void, int>((ref, customerId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/customer/$customerId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Customer');
  }
});

class CustomerPaginationData {
  final List<Customer> items;
  final int currentPage;
  final int maxPages;

  CustomerPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllCustomerProvider = FutureProvider.autoDispose
    .family<CustomerPaginationData, CustomerPaginationState>(
        (ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/customers?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return CustomerPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Customer.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
