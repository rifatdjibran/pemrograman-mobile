// [Langkah 5 - Praktikum 1]
// [Langkah 2 - Praktikum 2]
// [Langkah 2 - Praktikum 3] — PlanProvider naik di atas MaterialApp, home → PlanCreatorScreen
import 'package:flutter/material.dart';
import './views/plan_creator_screen.dart';
import './providers/plan_provider.dart';
import './models/data_layer.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}