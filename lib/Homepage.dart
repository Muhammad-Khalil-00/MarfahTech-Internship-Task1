import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Addscreeen.dart';
import 'package:todo_application/editScreen.dart';
import 'package:todo_application/models/save_task.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key, });



  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Notes",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        ),
      ),
      body: Consumer<SaveTask> (builder:(context,task,child){
        return ListView.builder(
          itemCount: task.tasks.length,
          itemBuilder: (BuildContext context , index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white),
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    task.tasks[index].title.trim(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration : task.tasks[index].isCompleted
                        ? TextDecoration.lineThrough
                          :TextDecoration.none
                    ),
                  ),
                  subtitle:
                  Text(
                    task.tasks[index].description,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration : task.tasks[index].isCompleted
                            ? TextDecoration.lineThrough
                            :TextDecoration.none
                    ),
                  ),
                  trailing:  Wrap(
                    children: [
                      Checkbox(
                          value: task.tasks[index].isCompleted,
                          onChanged: (_){
                            context.read<SaveTask>().Checktask(index);
                          }
                      ),
                      IconButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>editScreen(index: index,)));
                      },
                          icon: Icon(Icons.edit)
                      ),
                      IconButton(onPressed: (){
                        context.read<SaveTask>().removeTask(task.tasks[index]);
                      },
                          icon: Icon(Icons.delete)
                      ),
                    ],
                  ),
                ),
                

              ],
            ),
          );
      },
        );
      } ,
      ),

      floatingActionButton: Tooltip(
        message: "Add Notes",
        child: FloatingActionButton(

          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Addscreeen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
      

    );
  }
}
