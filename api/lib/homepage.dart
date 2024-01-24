import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  List<Todos> todo = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: todo.length,
                itemBuilder: (Context, index) {
                  return Container(
                    height: 130,
                    color: const Color.fromARGB(255, 105, 188, 240),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User id : ${todo[index].userId}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Id : ${todo[index].id}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Title : ${todo[index].title}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Completed : ${todo[index].completed}',
                            style: TextStyle(fontSize: 18),
                          )
                        ]),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text("Error Occurd"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<List<Todos>> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      print(response.statusCode);
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          todo.add(Todos.fromJson(index));
        }
        return todo;
      } else {
        return todo;
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
