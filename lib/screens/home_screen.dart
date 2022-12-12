import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttterdemowhive/model/usermodel.dart';
import 'package:fluttterdemowhive/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/usermodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  checkPrefsForUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var sharedToken = _prefs.getString('token');
    var apiToken = sharedToken;
    getprofile(apiToken!);
    print(apiToken);
    return apiToken;
  }

  getprofile(String token) async {
    final response = await http.get(
        Uri.parse('http://gymdemo.ashokfitness.com/api/v1/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['result']['token'].toString());
    }
  }

  @override
  void initState() {
    super.initState();

    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter demo'),
      ),
      body: FutureBuilder<Usermodel>(
        future: getprofile(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else if (snapshot.hasData) {
              // Extracting data from snapshot object
              final data = snapshot.data;
              print(data?.result?.user?.firstName);
              return Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${data?.result?.user?.firstName}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${data?.result?.user?.lastName}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${data?.result?.user?.username}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Image(
                      image:
                          NetworkImage('${data?.result?.user?.profilePicture}'),
                    ),
                  ],
                ),
              );
            }
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
