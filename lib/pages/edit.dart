import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String _task = "";

  void _updateTask(String val) {
    setState(() {
      _task = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (val) {
                  _updateTask(val);
                },
                minLines: 1,
                maxLines: 10,
                cursorColor: Colors.white,
                decoration: InputDecoration.collapsed(
                  hintText: "Enter Task",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: ElevatedButton(
              onPressed: () {
                if (_task.isNotEmpty) {
                  Navigator.pop(context, _task);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter a valid task"),
                    ),
                  );
                }
              },
              child: Icon(Icons.check),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}