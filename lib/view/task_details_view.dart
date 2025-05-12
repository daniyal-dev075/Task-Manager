import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/res/app_colors.dart';
import '../model/task_model.dart';
import '../utils/utils.dart';
import '../view_model/task_view_model.dart';

class TaskDetailsView extends StatefulWidget {
  final String taskId;
  const TaskDetailsView({super.key, required this.taskId});

  @override
  State<TaskDetailsView> createState() => _TaskDetailsViewState();
}

class _TaskDetailsViewState extends State<TaskDetailsView> {
  late Task task;
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final taskVM = Provider.of<TaskViewModel>(context);
    task = taskVM.tasks.firstWhere((t) => t.id == widget.taskId);
    _controller.text = task.details;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveDetails() {
    Provider.of<TaskViewModel>(context, listen: false)
        .updateTaskDetails(task.id, _controller.text);
    Utils.toastMessage('Details Saved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.buttonColour,
          title: Text(task.title,style: TextStyle(color: Colors.white),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: "Enter task details here...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColours.buttonColour
              ),
              onPressed: _saveDetails,
              child: const Text("Add Details",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
