import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:primary_bid/injection_container.dart';
import 'package:primary_bid/presentation/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  // Hive.registerAdapter(ProductEntityAdapter()); // TODO:

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( // TODO: Theme to PrimaryBid colours.
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
