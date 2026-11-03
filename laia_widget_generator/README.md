## Introduction

laia_widget_generator is a code generation package that generates widgets for 
a given dart class model. Including individual widget, editing, and list widgets.

## Installation

```
dev_dependencies:
    laia_widget_generator: latest
```

## Usage

See [the example](https://github.com/albieta/laia_flutter_gen/tree/main/example)

List headers toggle ascending/descending server-side sorting. Selecting a new
column replaces the previous sort. Sorting or changing filters returns to the
first page; page navigation retains both. The Riverpod generator adds `_id` as
the final sort key so equal column values have a stable order across pages.

For populated relations, configure the displayed paths in `defaultFields`, for
example `@ListWidgetGenAnnotation(defaultFields: ['name', 'roles.name'])`.
The filter selector then offers `roles.name`, searching the role name instead
of the stored reference IDs. The same path is used for sorting and population.
Nested field types are resolved from the model when available (otherwise text
search is used). String arrays match any element, with case-insensitive literal
text search. Nullable scalar types and lists of scalars use their element type.

After updating both `laia_widget_generator` and
`laia_riverpod_custom_generator` in the consuming app, regenerate the model
and generic widget outputs together; do not edit `.g.dart` files manually:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

## Tests

From `laia_widget_generator`, generate the test fixtures before running tests:

```sh
flutter pub get
dart run test/support/generate_fixtures.dart
flutter test
```

The fixture script invokes the actual generators and checks the syntax of their
complete output. Tests compile the generated search bar, headers, pagination
state and HTTP list provider, exercising filtering, sorting and request payloads.
HTTP responses are mocked; these tests do not require a running backend.

## Reporting issues

Report any bugs on the [project's issues](https://github.com/albieta/laia_flutter_gen/issues).
