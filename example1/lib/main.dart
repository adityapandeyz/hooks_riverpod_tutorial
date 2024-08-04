import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}

final currentDate = Provider<DateTime>((ref) {
  return DateTime.now();
},);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);  

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hookes Riverpod"),
      ),
      body: Center(child: Text(date.toIso8601String()),),
    );
  }
}