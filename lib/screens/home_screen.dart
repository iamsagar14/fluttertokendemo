import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttterdemowhive/model/usermodel.dart';
import 'package:http/http.dart' as http;

import '../model/usermodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<User> postList = [];
  Future<Usermodel> getPostApi() async {
    final response = await http.get(
      Uri.parse('http://gymdemo.ashokfitness.com/api/v1/login'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Usermodel.fromJson(data);
    } else {
      return Usermodel.fromJson(data);
    }
    //   for (Map i in data) {
    //     postList.add(User.fromJson(i));
    //     print(postList);
    //   }
    //   return postList;
    // } else {
    //   return postList;
    // }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   var userdata = getPostApi();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Usermodel>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading ');
                } else {
                  // return ListView.builder(
                  //     itemCount: snapshot.data.toString().length,
                  //     itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ),
                        );
                }
    },
            ),
          ),
        ],
      ),
    );
  }
}
