import 'package:flutter/material.dart';
import 'package:galaxy_task/services/api_service.dart';
import 'package:provider/provider.dart';

import 'pages/btm_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ApiService(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const BottomBarScreen(),
        ));
  }
}
