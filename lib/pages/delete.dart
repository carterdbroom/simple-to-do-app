
import 'package:flutter/material.dart';

class DeletePage extends StatelessWidget {
  final String item;
  DeletePage(this.item);
  
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
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Icon(Icons.delete),
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
