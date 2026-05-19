// [Langkah 6 - Praktikum 1]
// [Langkah 4,5,6,7,8,9 - Praktikum 2]
// [Langkah 3,5,7,8 - Praktikum 3] — tambah atribut plan, getter, update ke List<Plan>
import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../providers/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  // [Langkah 3 - Praktikum 3]
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // [Langkah 5 - Praktikum 3] — getter menggantikan variabel plan lokal
  Plan get plan => widget.plan;

  // [Langkah 10 - Praktikum 1]
  late ScrollController scrollController;

  // [Langkah 11 - Praktikum 1]
  // [Langkah 6 - Praktikum 3] — initState tetap sama
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  // [Langkah 13 - Praktikum 1]
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // [Langkah 9 - Praktikum 2]
  // [Langkah 7 - Praktikum 3] — update ke List<Plan>
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  // [Langkah 5 - Praktikum 2]
  // [Langkah 7 - Praktikum 3] — update ke List<Plan>
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == plan.name);
        Plan currentPlan = planNotifier.value[planIndex];
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
      },
    );
  }

  // [Langkah 8 - Praktikum 1]
  // [Langkah 7 - Praktikum 2]
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  // [Langkah 6 - Praktikum 2]
  // [Langkah 8 - Praktikum 3] — update ke List<Plan>
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          int planIndex = planNotifier.value
              .indexWhere((p) => p.name == plan.name);
          Plan currentPlan = planNotifier.value[planIndex];
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          int planIndex = planNotifier.value
              .indexWhere((p) => p.name == plan.name);
          Plan currentPlan = planNotifier.value[planIndex];
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
        },
      ),
    );
  }
}