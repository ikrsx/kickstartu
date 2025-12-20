import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kickstartu/config/configs_exports.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Supabase
  await Supabase.initialize(
    url: ApplicationStrings.instance.supabaseUrl,
    anonKey: ApplicationStrings.instance.supabaseKey,
  );

  // Run Multi Provider As Main App
  runApp(
    MultiProvider(
      providers: ApplicationLists.instance.applicaitionProviders,
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CoreViewModel>(context);

    return MaterialApp(
      home: ApplicationMainScreen(),
      theme: viewModel.currentTheme,
    );
  }
}
