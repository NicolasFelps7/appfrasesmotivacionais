import 'package:flutter_test/flutter_test.dart';
import 'package:frase_motivacionais/main.dart';

void main() {
  testWidgets(
    'Teste App Frases Motivacionais',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(
        find.text('💬 Frases Motivacionais'),
        findsOneWidget,
      );

      expect(
        find.text('NOVA FRASE'),
        findsOneWidget,
      );
    },
  );
}