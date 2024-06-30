import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_project/Api_name.dart';
import 'package:i_project/profile.dart';
import 'package:i_project/register.dart';
import 'package:http/http.dart' as http;
import 'login_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String username = '';
  late String email_id = '';
  late String password = '';

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();




  void login() async {
    final response = await http.post(Uri.parse("http://${Api_name().api}/student_result/login.php"),
      body: jsonEncode(<String, dynamic>{
        "username": _usernameController.text,
      }),
    );
    final login = loginFromJson(response.body);

    if (login.password.trim().toLowerCase() == _passwordController.text.trim().toLowerCase()) {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage(login_model: login,)),
      );
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username/email or password.'),
          duration: Duration(seconds: 3),
        ),
      );
    }



  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff54ffa7),
        title: Text('Login'),
        leading: Icon(Icons.home),
        actions: [
          Icon(Icons.notifications),
          Icon(Icons.logout)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Image(
                height: 200,
                width: 200,
                image: AssetImage("images/LOGO.jpg"),
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username or Email'),
              ),
              SizedBox(height: 10),
              // Password field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 10),
              // Forgot Password
              TextButton(
                onPressed: () {
                  // Add forgot password logic here
                },
                child: Text('Forgot Password?'),
              ),
              SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent
                ),
                onPressed: () {

                  login();
                },
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              // Register Button
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent
                ),
                onPressed: () {
                  // Navigate to registration page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
