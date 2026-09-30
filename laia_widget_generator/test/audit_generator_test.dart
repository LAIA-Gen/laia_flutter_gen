import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'generated/loginevent_widgets.dart' as login;

void main() {
  test('audit models have no generated mutation forms or generic CRUD cards',
      () {
    for (final model in ['auditlog', 'loginevent']) {
      final code =
          File('test/generated/${model}_source.txt').readAsStringSync();
      expect(code, isNot(contains('Icons.delete')));
      expect(code, isNot(contains('Icons.edit')));
      expect(code, isNot(contains('http.put(')));
      expect(code, isNot(contains('http.delete(')));
      expect(code, contains('headers: await headers()'));
    }
    final home = File('test/generated/audit_home.txt').readAsStringSync();
    expect(home, contains('const AuditLogAuditMenu()'));
    expect(home, contains('const LoginEventAuditMenu()'));
    expect(home, isNot(contains("title: 'AuditLog'")));
    expect(home, isNot(contains('AuditLogUpdate')));
  });

  testWidgets(
      'generated LoginEvent entry uses authenticated search and read-only details',
      (tester) async {
    final requests = <http.Request>[];
    login.httpClientFactory = () => MockClient((request) async {
          requests.add(request);
          return http.Response(
              jsonEncode({
                'items': [
                  {
                    'id': 'entry',
                    'userId': 'removed-user-id',
                    'createdAt': '2026-09-28T12:00:00Z',
                    'ipAddress': '127.0.0.1',
                    'userAgent': 'Browser test'
                  }
                ],
                'max_pages': 1
              }),
              200);
        });
    await tester
        .pumpWidget(const MaterialApp(home: login.LoginEventListView()));
    await tester.pumpAndSettle();
    expect(requests.single.url.path, '/loginevents/');
    expect(requests.single.headers['Authorization'], 'Bearer test-token');
    expect(find.text('removed-user-id'), findsOneWidget);
    await tester.tap(find.text('removed-user-id'));
    await tester.pumpAndSettle();
    expect(find.text('LoginEvent · Detalle'), findsOneWidget);
    expect(find.text('Solo lectura'), findsOneWidget);
  });
}
