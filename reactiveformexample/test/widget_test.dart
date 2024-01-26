// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:reactiveformexample/flutter_form_example.dart';
import 'package:reactiveformexample/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactiveformexample/my_home_page.dart';
import 'package:reactiveformexample/reactive_form_example.dart';

import 'test_app.dart';

void main() {
  group('On App start', () {
    testWidgets('application is built', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byType(MaterialApp), findsOneWidget);

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));

      expect(app.title, 'Easy Reactive Forms');
      expect(app.theme?.primaryColor, Colors.blue);
    });

    testWidgets('home view is loaded', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.text('Easy Reactive Forms'), findsOneWidget);
    });

    testWidgets('MyHomeView widgets are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key('flutter_example')), findsOneWidget);
      expect(find.byKey(const Key('reactive_example')), findsOneWidget);
      expect(find.text('Flutter Form example'), findsOneWidget);
      expect(find.text('Reactive Form example'), findsOneWidget);
    });
  });

  group('On Home Page', () {
    testWidgets(
        'when flutter example button is pressed '
        'then navigate to FlutterFormExample', (WidgetTester tester) async {
      // Having
      await tester.pumpWidget(const MyApp());

      // Then
      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.byKey(const Key('flutter_example')), findsOneWidget);

      // When
      await tester.tap(find.byKey(const Key('flutter_example')));
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(FlutterFormExample), findsOneWidget);
    });

    testWidgets(
        'when reactive example button is pressed '
        'then navigate to ReactiveFormExample', (WidgetTester tester) async {
      // Having
      await tester.pumpWidget(const MyApp());

      // Then
      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.byKey(const Key('flutter_example')), findsOneWidget);

      // When
      await tester.tap(find.byKey(const Key('reactive_example')));
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(ReactiveFormExample), findsOneWidget);
    });
  });

  group('On FlutterFormExample Page', () {
    testWidgets('all widgets are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byKey(const Key('nickname')), findsOneWidget);
      expect(find.byKey(const Key('email')), findsOneWidget);
      expect(find.byKey(const Key('comment')), findsOneWidget);
      expect(find.byKey(const Key('termsAccepted')), findsOneWidget);
      expect(find.byKey(const Key('submit')), findsOneWidget);
    });

    testWidgets('when nickname is cleared show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('nickname')), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter some text'), findsOneWidget);
    });

    testWidgets('when nickname has invalid characters show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('nickname')), 'hello world');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(
          find.text('Incorrect pattern: invalid characters'), findsOneWidget);
    });

    testWidgets(
        'when nickname has valid characters no validation error is show',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('nickname')), 'hello_world');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Incorrect pattern: invalid characters'), findsNothing);
    });

    testWidgets('when email is cleared show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('email')), 'hello');
      await tester.enterText(find.byKey(const Key('email')), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter email'), findsOneWidget);
    });

    testWidgets('when email is not a valid email string show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('email')), 'hello');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Incorrect pattern: invalid email'), findsOneWidget);
    });

    testWidgets(
        'when email is a valid email string no validation error is show',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('email')), 'hello@mail.de');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Incorrect pattern: invalid email'), findsNothing);
    });

    testWidgets('when a field is invalid no snackbar is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //Given
      await tester.enterText(find.byKey(const Key('email')), 'hello');
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('comment')), 'failed test');
      await tester.tap(find.byKey(const Key('termsAccepted')));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      final element = find.byType(ElevatedButton);

      //When
      await tester.tap(element);
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Incorrect pattern: invalid email'), findsOneWidget);
      expect(tester.widget<ElevatedButton>(element).enabled, isFalse);
    });

    testWidgets(
        'when the terms and conditions are not selected no snackbar is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //Given
      await tester.enterText(find.byKey(const Key('email')), 'hello@email.de');
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('comment')), 'failed test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      final element = find.byType(ElevatedButton);

      //When
      await tester.tap(element);
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(SnackBar), findsNothing);
      expect(tester.widget<ElevatedButton>(element).enabled, isFalse);
    });

    testWidgets('when all fields are ok snackbar is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //Given
      await tester.enterText(find.byKey(const Key('email')), 'hello@email.de');
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('comment')), 'failed test');
      await tester.tap(find.byKey(const Key('termsAccepted')));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //When
      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });

  group('On ReactiveFormExample Page', () {
    testWidgets('all widgets are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ReactiveForm), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ReactiveForm), findsOneWidget);
      expect(find.byKey(const Key('nickname')), findsOneWidget);
      expect(find.byKey(const Key('email')), findsOneWidget);
      expect(find.byKey(const Key('comment')), findsOneWidget);
      expect(find.byKey(const Key('termsAccepted')), findsOneWidget);
      expect(find.byKey(const Key('submit')), findsOneWidget);
    });

    testWidgets('when nickname is cleared show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('nickname')), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter some text'), findsOneWidget);
    });

    testWidgets('when nickname has invalid characters show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('nickname')), 'hello world');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(
          find.text('Incorrect pattern: invalid characters'), findsOneWidget);
    });

    testWidgets(
        'when nickname has valid characters no validation error is show',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('nickname')), 'hello_world');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Incorrect pattern: invalid characters'), findsNothing);
    });

    testWidgets('when email is cleared show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('email')), 'hello');
      await tester.enterText(find.byKey(const Key('email')), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter some text'), findsOneWidget);
    });

    testWidgets('when email is not a valid email string show validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('email')), 'hello');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Incorrect pattern: invalid email'), findsOneWidget);
    });

    testWidgets(
        'when email is a valid email string no validation error is show',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byKey(const Key('email')), 'hello@mail.de');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Incorrect pattern: invalid email'), findsNothing);
    });

    testWidgets('when a field is invalid submit button is disabled',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //Given
      await tester.enterText(find.byKey(const Key('email')), 'hello');
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('comment')), 'failed test');
      await tester.tap(find.byKey(const Key('termsAccepted')));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      final element = find.byType(ElevatedButton);

      //When
      await tester.tap(element);
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(SnackBar), findsNothing);
      expect(find.text('Incorrect pattern: invalid email'), findsOneWidget);
      expect(tester.widget<ElevatedButton>(element).enabled, isFalse);
    });

    testWidgets(
        'when the terms and conditions are not selected no snackbar is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //Given
      await tester.enterText(find.byKey(const Key('email')), 'hello@email.de');
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('comment')), 'failed test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      final element = find.byType(ElevatedButton);

      //When
      await tester.tap(element);
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(SnackBar), findsNothing);
      expect(tester.widget<ElevatedButton>(element).enabled, isFalse);
    });

    testWidgets('when all fields are ok snackbar is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //Given
      await tester.enterText(find.byKey(const Key('email')), 'hello@email.de');
      await tester.enterText(find.byKey(const Key('nickname')), 'hello');
      await tester.enterText(find.byKey(const Key('comment')), 'failed test');
      await tester.tap(find.byKey(const Key('termsAccepted')));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //When
      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
