import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/utils/routes/route_name.dart';
import '../../model/task_model.dart';
import '../../utils/utils.dart';
import '../../view_model/task_view_model.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  const TaskTile({super.key,required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {


  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context, listen: false);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      ),
      tileColor: Colors.green.shade100,
      onTap: () {
        Navigator.pushNamed(context, RouteName.taskDetailsView,arguments: widget.task.id);
      },
      subtitle: widget.task.details.trim().isNotEmpty
          ? Text(
        Utils.getPreviewText(widget.task.details),
        style: TextStyle(color: Colors.grey[600]),
      )
          : null,
      leading: Checkbox(
        value: widget.task.isCompleted,
        onChanged: (_) => taskVM.toggleCompletion(widget.task.id),
      ),
      title: Text(
        widget.task.title,
        style: TextStyle(
          decoration: widget.task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => taskVM.deleteTask(widget.task.id),
      ),
    );
  }
}