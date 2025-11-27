import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kickstartu/config/application_lists.dart';
import 'package:kickstartu/config/application_strings.dart';
import 'package:kickstartu/ui/main_screen/application_main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ApplicationStrings.instance.supabaseUrl,
    anonKey: ApplicationStrings.instance.supabaseKey,
  );

  runApp(
    MultiProvider(
      providers: ApplicationLists.instance.applicationProvider,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ApplicationMainScreen());
  }
}
