import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttterdemowhive/model/usermodel.dart';
import 'package:fluttterdemowhive/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void login(String email, password) async {
    try {
      Response response = await get(
        Uri.parse('http://gymdemo.ashokfitness.com/api/v1/login').replace(
          queryParameters: {
            'username': email,
            'password': password,
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['result']['token'].toString());
        pageRoute(data['result']['token']);
        // checkPrefsForUser();
        //
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString("login", data["token"]);
        // log(data["token"]);

        //

        // var data2 = jsonDecode(data['result']);

        // List<Result> userdata = data2.map((f) => Result.fromJson(f)).toList();\
        // userdata;
        // print(data['result'].toString());
        //  print('account created successfully');
      } else {
        print('failed to loigin');
      }
    } catch (e) {
      print(e);
    }
  }

  void pageRoute(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  // Future<void> saveUserInfo() async {
  //   final Result result = Result.fromJson(
  //     {
  //       "token": "2d844a576aa3b061603ad13c6786a8d93910b41a",
  //       "user": {
  //         "first_name": "Suman",
  //         "last_name": "Dhital",
  //         "username": "sumanDtl",
  //         "profile_picture":
  //             "http://gymdemo.ashokfitness.com/media/member/22/12/pic_Mgo51zq.png"
  //       }
  //     },
  //   );
  //
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool inforesult = await prefs.setString('Token', jsonEncode(result.token));
  //   print(inforesult);
  // }
  //
  // Future<Result> getUserInfo() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   Map<String, dynamic> userMap = {};
  //   final String? userStr = prefs.getString('Token');
  //   if (userStr != null) {
  //     userMap = jsonDecode(userStr) as Map<String, dynamic>;
  //   }
  //
  //   final Result result = Result.fromJson(userMap);
  //   print(result);
  //   return result;
  // }
  // checkPrefsForUser() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   var sharedToken = _prefs.getString('token');
  //   tokenData = sharedToken!;
  //   print(sharedToken);
  //   return sharedToken;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Welcome',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Welcome To login Page',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),
              child: TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'enter your email',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),
              child: TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: 'enter your password ',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );

                // saveUserInfo();
                // getUserInfo();

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomeScreen(),
                //   ),
                //);
              },
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(child: Text('login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
