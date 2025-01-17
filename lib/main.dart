import 'package:flutter/material.dart';

void main() {
  runApp(const TaskListApp());
}

class Task {
  String title;
  String description;
  bool isComplete;

  Task({required this.title, required this.description, this.isComplete = false});
}

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  'Task List App',
      home: const TaskListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [Task(title: "Hello", description:"Goodbye")];
  
  void _addTask() async {
  //***** Activity 2 *****
    //Hints: Look at the slides...
  //**********************
    
  //***** Activity 4 *****
    // final newTask = await showDialog<Task>(
    //     context: context,
    //     builder: (context) => AddTaskDialog(),
    //   );
    //Hints: Now that you have the object newTask, now implement it into the task list
  //**********************
  }

//***** Activity 3 *****
  void _deleteTask(Task task) {
    //Hints: remove function is built in, use what you learned in Activity 2
  }
//**********************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        backgroundColor: const Color.fromARGB(255, 255, 220, 158),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            color: const Color.fromARGB(255, 255, 254, 252),
        //***** Activity 1 *****
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 150),
        //**********************
            child: ListTile(
              title: Text(
                task.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(task.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
      //***** Activity 3 *****
                  // IconButton(
                      //Hints: Look at documentation 
                      //(https://api.flutter.dev/flutter/material/IconButton-class.html)
                  // ),
      //**********************
                  Checkbox(
                    value: task.isComplete,
                    onChanged: (value) {
                      setState(() {
                        task.isComplete = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 220, 158),
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}


class AddTaskDialog extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter task title',
            ),
          ),
      //***** Activity 5 ***** 
          // Now add a textfield for the description
          // Hint: Refer to the structure of title's TextField
      //**********************
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final newTask = Task(
              title: titleController.text,
              description: descriptionController.text,
            );
            Navigator.pop(context, newTask);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
