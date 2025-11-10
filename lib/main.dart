import 'package:flutter/material.dart';
import 'package:my_school/app/dependency_injection/di.dart';
import 'package:my_school/app/routing/router.dart';
import 'package:my_school/app/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://yfxmoawvxnwkzzmzbpuc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmeG1vYXd2eG53a3p6bXpicHVjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA1MDQ2MDksImV4cCI6MjA3NjA4MDYwOX0.lgSvr4xQc_nmr3PwXjZ1IXqEUfTPCoJO4iX0qX8bP38',
  );
  setupDI();
  runApp(
    MaterialApp.router(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      routerConfig: Routing.instance.goRouter,
      theme: appTheme,
    ),
  );
}
