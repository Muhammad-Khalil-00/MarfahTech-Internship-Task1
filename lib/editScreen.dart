import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/save_task.dart';
class editScreen extends StatefulWidget {
  final int index;

  const editScreen({super.key, required this.index});


  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  final titleeditcontroller = TextEditingController();
  final descriptioneditcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    final task = context.read<SaveTask>().tasks[widget.index];
    titleeditcontroller.text = task.title;
    descriptioneditcontroller.text = task.description;
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Edit Notes",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50,),
              TextField(
                controller: titleeditcontroller,
                autofocus: true,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
                decoration: InputDecoration(
                  hintText: "Edit Title",
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsets.all(12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Border always visible
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Same as above
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: 40,),
              TextField(
                maxLines: 6,
                controller: descriptioneditcontroller,
                autofocus: true,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: "Edit Description",
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: (){
                    context.read<SaveTask>().updateTask(
                      widget.index,
                      titleeditcontroller.text.trim(),
                      descriptioneditcontroller.text.trim(),
                    );

                    titleeditcontroller.clear();
                    descriptioneditcontroller.clear();
                    Navigator.of(context).pop();

                  },
                  child: Text("Edit")
              )


            ],
          )
      ),
    );;
  }
}
