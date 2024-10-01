import 'package:flutter_test/flutter_test.dart';

import 'package:biodata/main.dart'; // Pastikan nama ini sesuai dengan proyek Anda

void main() {
  testWidgets('Profile Page loads with correct data',
      (WidgetTester tester) async {
    // Build the ProfilePageApp and trigger a frame.
    await tester.pumpWidget(ProfilePageApp());

    // Verify that profile name 'John Doe' is displayed.
    expect(find.text('Zivana Afra Yulianto'), findsOneWidget);

    // Verify that the job title 'Mobile Developer' is displayed.
    expect(find.text('Mobile Developer'), findsOneWidget);

    // Verify that the location 'San Francisco, CA' is displayed.
    expect(find.text('Purwokerto, Banyumas'), findsOneWidget);
  });
}
