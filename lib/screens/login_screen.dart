import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttterdemowhive/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String email, password) async {
    try {
      Response response = await get(
          Uri.parse('http://gymdemo.ashokfitness.com/api/v1/login')
              .replace(queryParameters: {
        'username': email,
        'password': password,
      }));
      if (response.statusCode == 200) {
        // jsonDecode(response.body)

        print(response.body);
        print('account created successfully');
      } else {
        print('failed to loigin');
      }
    } catch (e) {
      print(e);
    }
  }

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
                  hintText: 'enter you password ',
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
