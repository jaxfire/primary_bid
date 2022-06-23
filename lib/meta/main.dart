import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:primary_bid/meta/injection_container.dart';
import 'package:primary_bid/meta/primary_bid_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  // Hive.registerAdapter(ProductEntityAdapter()); // TODO: Once we store products in the cart

  await initDependencies();

  runApp(const PrimaryBidApp());
}
