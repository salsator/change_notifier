import 'package:change_notifier/add_item_form.dart';
import 'package:change_notifier/data.dart';
import 'package:change_notifier/view_loading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => Data(),
          child: const MyApp()

      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router(),
      debugShowCheckedModeBanner: false,
    );
  }
}

GoRouter router() {
  return GoRouter(initialLocation: '/loading',
      routes: [
    GoRoute(
        path: '/loading',
        builder: (context, state) => const ViewLoading(),
        routes: [
          GoRoute(path: "add",
          builder: (context, state) => const AddItemForm())
        ])
  ]);
}

/// dodelat načítání a sbíráná dat
/// pak refres de se data vynulují
