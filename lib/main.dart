import 'package:acecook/src/config/app_router.dart';
import 'package:acecook/src/network/network_service.dart';
import 'package:acecook/src/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  NetworkService.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocsDir = await getApplicationDocumentsDirectory();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Acecook',
      theme: AppTheme.lightTheme.copyWith(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    );
  }
}
