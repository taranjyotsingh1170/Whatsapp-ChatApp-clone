import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilderDemo extends StatelessWidget {
  const FutureBuilderDemo({Key? key}) : super(key: key);

  // Future<int> userAge() async {
  //   int age = 9;
  //   await Future.delayed(const Duration(seconds: 3));

  //   if (age > 10) {
  //     throw 'Age cannot be greater than 10';
  //   }
  //   return age;
  // }

  Future<String> getCityWeather(String city) async {
    var _key = 'f2ead2daafe92b042834cb9aa218833c';
    var _url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_key';

    Response response = await http.get(Uri.parse(_url));
    
    await Future.delayed(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw 'Unknown error occured';
    }
  }

  // Future<List<UserTodosModel>> getUserTodo() async {
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

  //   Response response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     List<UserTodosModel> userTodosModel =
  //         userTodosModelFromMap(response.body);

  //     return userTodosModel;
  //   } else {
  //     throw 'Unknown error';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Enter Location'),
            ),
          ),

          const SizedBox(height: 15,),
          Center(
            child: SingleChildScrollView(
              child: FutureBuilder<String>(
                future: getCityWeather('Ludhiana'),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    //List<UserTodosModel> _list = snapshot.data!;
                    return Text(snapshot.data.toString());

                    // return ListView.builder(
                    //     itemCount: _list.length,
                    //     itemBuilder: (_, index) {
                    //       return ListTile(
                    //         tileColor: Colors.black,
                    //         title: Text(
                    //           _list[index].title,

                    //         ),
                    //       );
                    //     });
                  }
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const Text('Loading...');
                  }

                  return const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<UserTodosModel> userTodosModelFromMap(String str) =>
    List<UserTodosModel>.from(
        json.decode(str).map((x) => UserTodosModel.fromMap(x)));

String userTodosModelToMap(List<UserTodosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserTodosModel {
  UserTodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory UserTodosModel.fromMap(Map<String, dynamic> json) => UserTodosModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
