// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShoeCWProxy {
  Shoe brand(String brand);

  Shoe customerId(String customerId);

  Shoe id(String id);

  Shoe name(String name);

  Shoe price(double price);

  Shoe size(double size);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shoe(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shoe(...).copyWith(id: 12, name: "My name")
  /// ````
  Shoe call({
    String? brand,
    String? customerId,
    String? id,
    String? name,
    double? price,
    double? size,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShoe.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShoe.copyWith.fieldName(...)`
class _$ShoeCWProxyImpl implements _$ShoeCWProxy {
  final Shoe _value;

  const _$ShoeCWProxyImpl(this._value);

  @override
  Shoe brand(String brand) => this(brand: brand);

  @override
  Shoe customerId(String customerId) => this(customerId: customerId);

  @override
  Shoe id(String id) => this(id: id);

  @override
  Shoe name(String name) => this(name: name);

  @override
  Shoe price(double price) => this(price: price);

  @override
  Shoe size(double size) => this(size: size);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shoe(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shoe(...).copyWith(id: 12, name: "My name")
  /// ````
  Shoe call({
    Object? brand = const $CopyWithPlaceholder(),
    Object? customerId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
  }) {
    return Shoe(
      brand: brand == const $CopyWithPlaceholder() || brand == null
          ? _value.brand
          // ignore: cast_nullable_to_non_nullable
          : brand as String,
      customerId:
          customerId == const $CopyWithPlaceholder() || customerId == null
              ? _value.customerId
              // ignore: cast_nullable_to_non_nullable
              : customerId as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double,
      size: size == const $CopyWithPlaceholder() || size == null
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as double,
    );
  }
}

extension $ShoeCopyWith on Shoe {
  /// Returns a callable class that can be used as follows: `instanceOfShoe.copyWith(...)` or like so:`instanceOfShoe.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShoeCWProxy get copyWith => _$ShoeCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class ShoeWidget extends StatefulWidget {
  final Shoe? element;
  final bool isEditing;

  const ShoeWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _ShoeWidgetState createState() => _ShoeWidgetState();
}

class _ShoeWidgetState extends State<ShoeWidget> {
  final GlobalKey<StringWidgetState> brandWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<CustomerFieldWidgetState> customerIdWidgetKey =
      GlobalKey<CustomerFieldWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<DoubleWidgetState> priceWidgetKey =
      GlobalKey<DoubleWidgetState>();
  final GlobalKey<DoubleWidgetState> sizeWidgetKey =
      GlobalKey<DoubleWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: brandWidgetKey,
              fieldName: "brand",
              fieldDescription: "This is the brand",
              editable: true,
              placeholder: "Type the brand",
              value: widget.element?.brand,
            ),
            CustomerFieldWidget(
              key: customerIdWidgetKey,
              fieldName: "customerId",
              fieldDescription: "This is the customerId",
              editable: true,
              placeholder: "Type the customerId",
              value: widget.element?.customerId,
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
            DoubleWidget(
              key: priceWidgetKey,
              fieldName: "price",
              fieldDescription: "This is the price",
              editable: true,
              placeholder: "Type the price",
              value: widget.element?.price,
            ),
            DoubleWidget(
              key: sizeWidgetKey,
              fieldName: "size",
              fieldDescription: "This is the size",
              editable: true,
              placeholder: "Type the size",
              value: widget.element?.size,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedbrand = brandWidgetKey.currentState?.getUpdatedValue();

          String? updatedcustomerId =
              customerIdWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          double? updatedprice = priceWidgetKey.currentState?.getUpdatedValue();

          double? updatedsize = sizeWidgetKey.currentState?.getUpdatedValue();

          Shoe updatedShoe = widget.element ??
              Shoe(
                brand: updatedbrand ?? '',
                customerId: updatedcustomerId ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
                price: updatedprice ?? 0.0,
                size: updatedsize ?? 0.0,
              );

          updatedShoe = updatedShoe.copyWith(
              brand: updatedbrand,
              customerId: updatedcustomerId,
              id: updatedid,
              name: updatedname,
              price: updatedprice,
              size: updatedsize);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateShoeProvider(updatedShoe));
              print('Shoe updated successfully');
            } else {
              await container.read(createShoeProvider(updatedShoe));
              print('Shoe created successfully');
            }
          } catch (error) {
            print('Failed to update Shoe: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class ShoeFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const ShoeFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  ShoeFieldWidgetState createState() => ShoeFieldWidgetState();
}

class ShoeFieldWidgetState extends State<ShoeFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Shoe> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Shoe shoe = await container.read(getShoeProvider(widget.value!).future);
    _typeAheadController.text = '${shoe.name} <id: ${shoe.id}>';
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
                          child: TypeAheadField<Shoe>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final shoePaginationData = await container.read(
                                  getAllShoeProvider(container
                                          .read(shoePaginationProvider))
                                      .future);
                              final options = shoePaginationData.items;
                              return options
                                  .where((shoe) =>
                                      shoe.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      shoe.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, shoe) {
                              return ListTile(
                                title: Text('${shoe.name} <id: ${shoe.id}>'),
                              );
                            },
                            onSelected: (Shoe value) {
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
                Shoe shoe =
                    await container.read(getShoeProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ShoeWidget(element: shoe, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch shoe: $error');
              }
            },
            child: const Text('View Shoe'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class ShoeHomeWidget extends StatelessWidget {
  const ShoeHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShoeListView()),
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
              'assets/shoe.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Shoe",
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

Shoe _$ShoeFromJson(Map<String, dynamic> json) => Shoe(
      brand: json['brand'] as String,
      customerId: json['customerId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      size: (json['size'] as num).toDouble(),
    );

Map<String, dynamic> _$ShoeToJson(Shoe instance) => <String, dynamic>{
      'brand': instance.brand,
      'customerId': instance.customerId,
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'size': instance.size,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class ShoeListView extends ConsumerWidget {
  const ShoeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(shoePaginationProvider);
    final shoesAsyncValue = ref.watch(getAllShoeProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(shoePaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(shoePaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(shoePaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      fieldsFilterStates[fieldName] = filterValue;
      ref.read(shoePaginationProvider.notifier).setFilters(fieldsFilterStates);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (fieldsFilterStates.containsKey(fieldName)) {
        fieldsFilterStates.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Shoe List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoeWidget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: shoesAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (ShoePaginationData data) {
            final shoes = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'brand': 'String',
                      'customerId': 'String',
                      'id': 'String',
                      'name': 'String',
                      'price': 'double',
                      'size': 'double'
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
                                              'brand',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['brand'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['brand'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('brand') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('brand')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'customerId',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'customerId'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'customerId'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('customerId') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('customerId')},
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
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'price',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['price'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['price'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('price') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('price')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'size',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['size'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['size'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('size') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('size')},
                                    ),
                                  ],
                                  rows: shoes.map((shoe) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child:
                                                Text(shoe.brand.toString()))),
                                        DataCell(Center(
                                            child: Text(
                                                shoe.customerId.toString()))),
                                        DataCell(Center(
                                            child: Text(shoe.id.toString()))),
                                        DataCell(Center(
                                            child: Text(shoe.name.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(shoe.price.toString()))),
                                        DataCell(Center(
                                            child: Text(shoe.size.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ShoeWidget(
                                                  element: shoe,
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
      ShoePaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(shoePaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class ShoePaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  ShoePaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class ShoePaginationNotifier extends StateNotifier<ShoePaginationState> {
  ShoePaginationNotifier()
      : super(ShoePaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = ShoePaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = ShoePaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = ShoePaginationState(
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

final shoePaginationProvider =
    StateNotifierProvider<ShoePaginationNotifier, ShoePaginationState>(
  (ref) => ShoePaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getShoeProvider =
    FutureProvider.autoDispose.family<Shoe, String>((ref, shoeId) async {
  final json = await http.get(Uri.parse('$baseURL/shoe/$shoeId'));
  final jsonData = jsonDecode(json.body);
  return Shoe.fromJson(jsonData);
});

final createShoeProvider =
    FutureProvider.autoDispose.family<void, Shoe>((ref, shoeInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/shoe'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(shoeInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Shoe');
  }
});

final updateShoeProvider =
    FutureProvider.autoDispose.family<void, Shoe>((ref, shoeInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/shoe/${shoeInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(shoeInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Shoe');
  }
});

final deleteShoeProvider =
    FutureProvider.autoDispose.family<void, int>((ref, shoeId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/shoe/$shoeId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Shoe');
  }
});

class ShoePaginationData {
  final List<Shoe> items;
  final int currentPage;
  final int maxPages;

  ShoePaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllShoeProvider = FutureProvider.autoDispose
    .family<ShoePaginationData, ShoePaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/shoes?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return ShoePaginationData(
    items:
        (jsonData['items'] as List).map((data) => Shoe.fromJson(data)).toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
