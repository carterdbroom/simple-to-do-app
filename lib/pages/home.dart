import 'package:flutter/material.dart';
import 'package:todoapp/pages/edit.dart';
import 'package:todoapp/pages/delete.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> taskList = [];

  void addTask(String task) {
    setState(() {
      taskList.add(task);
    });
  }

  void removeTask(String task) {
    setState(() {
      taskList.remove(task);
    });
  }

  Widget drawTasks(List<String> list) {
    if (list.isEmpty) {
      return SizedBox.shrink();
    } else {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                  onPressed: () {
                    _toDelete(taskList[index]);
                  },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(item),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _toDelete(String item) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeletePage(item),
      ),
    );

    if (result != null && result is bool && result){
      setState((){
        taskList.remove(item);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "To Do",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[200],
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
                if (result != null && result is String) {
                  addTask(result);
                }
              },
              child: Text("+"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(child: drawTasks(taskList)),
        ],
      ),
    );
  }
}