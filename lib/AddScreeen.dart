import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/models/save_task.dart';
import 'package:todo_application/models/task_model.dart';
class Addscreeen extends StatefulWidget {
  const Addscreeen({super.key});

  @override
  State<Addscreeen> createState() => _AddscreeenState();
}

class _AddscreeenState extends State<Addscreeen> {
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Add Notes",
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
              controller: titlecontroller,
              autofocus: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: "title",
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
              controller: descriptioncontroller,
              autofocus: true,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
              fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  hintText: "Description",
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
                  context.read<SaveTask>().addTask(
                    Task(title: titlecontroller.text,
                        description: descriptioncontroller.text,
                      isCompleted: false
                    )
                  );
                  titlecontroller.clear();
                  descriptioncontroller.clear();
                  Navigator.of(context).pop();
                },

                child: Text("Add")
            )


          ],
        )
      ),
    );
  }
}
