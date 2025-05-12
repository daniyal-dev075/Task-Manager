import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/res/app_colors.dart';
import 'package:task_manager/view_model/task_view_model.dart';
import 'package:task_manager/view_model/user_view_model.dart';
import '../res/components/task_tile.dart';
import '../utils/routes/route_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context);
    final userPrefernces = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Task Manager',style: TextStyle(color: Colors.white),),
        backgroundColor: AppColours.buttonColour,
        actions: [
          IconButton(
            icon: const Icon(Icons.add,color: Colors.white,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Add Task Title"),
                  content: TextField(controller: controller),
                  actions: [
                    TextButton(
                      onPressed: () {
                        final taskTitle = controller.text.trim();
                        Provider.of<TaskViewModel>(context, listen: false)
                            .addTask(taskTitle, context); // Add task with validation

                        controller.clear(); // Clear the text field after adding the task
                        Navigator.pop(context); // Close the dialog
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: AppColours.buttonColour),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: taskVM.tasks.isEmpty
          ? const Center(child: Text("No tasks available",style: TextStyle(fontSize: 20),))
          : Padding(
            padding: const EdgeInsets.only(left:  10.0,right: 10,top: 10),
            child: ListView.separated(
                    itemCount: taskVM.tasks.length,
                    itemBuilder: (context, index) {
            final task = taskVM.tasks[index];
            return TaskTile(task: task);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColours.buttonColour,
        child: Icon(Icons.logout,color: Colors.white,),
          onPressed: (){
        userPrefernces.removeUser();
        Navigator.pushNamed(context, RouteName.loginView);
      }),
    );
  }
}
