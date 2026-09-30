# LAIA Flutter Code Generator

This repository contains the necessary packages for Flutter code generation:

**Dev Dependencies:**
- `laia_riverpod_custom_generator` [pub dev](https://pub.dev/packages/laia_riverpod_custom_generator)
- `laia_widget_generator` [pub dev](https://pub.dev/packages/laia_widget_generator)

**Dependencies:**
- `laia_annotations` [pub dev](https://pub.dev/packages/laia_annotations)

## AuditLog and LoginEvent backoffice

The read-only audit screens live in this repository, in
`laia_widget_generator/lib/src/audit_widget_source.dart`. They are emitted by
`ListWidgetGenerator` for models named `AuditLog` and `LoginEvent`; no project-specific
screen files or Python UI templates are required.

The generated model library uses the same `baseURL`, `http` client, `getHeaders()`,
Flutter and JSON imports as other generated models. Annotate audit models with
`@ListWidgetGenAnnotation()`, `@HomeWidgetElementGenAnnotation()` and
`@ElementWidgetGen()` as usual. The element widget also opens the read-only list;
it never emits an editing form for audit records.

Include `AuditLogHomeWidget` and `LoginEventHomeWidget` in the consuming app's
`lib/home.txt` and import its generated audit model libraries from `home.dart`.
The normal LAIA model generation supplies these entries. The generated dashboard
shows the audit menu only after the API accepts an authenticated administrator
search; the backend remains responsible for authorization. Custom home pages can
also embed `AuditLogHomeWidget` and `LoginEventHomeWidget`.

Screens support server-side sorting with a stable `_id` tie-breaker, pagination,
exact-value filters, refresh and full selectable JSON details. They show user IDs
even if the referenced user was deleted, and offer no create, update or delete UI.
After updating this generator, regenerate the consuming app with
`dart run build_runner build --delete-conflicting-outputs`.

From `laia_widget_generator`, validate generated output with:

```sh
flutter pub get
dart run test/support/generate_fixtures.dart
dart run test/support/generate_audit_fixtures.dart
flutter test
```
