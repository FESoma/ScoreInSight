import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:i_project/Api_name.dart';
import 'package:i_project/result.dart';

import 'login.dart';
import 'login_model.dart';

class ProfilePage extends StatefulWidget {
   Login_model login_model;
  ProfilePage({required this.login_model});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   TextEditingController name = TextEditingController();
   TextEditingController roll = TextEditingController();
   TextEditingController dept = TextEditingController();
   TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/abc.png"),
                ),
              ),
              SizedBox(height: 16),
              _buildInfoBox("Name", widget.login_model.name),
              SizedBox(height: 16),
              _buildInfoBox("ID", widget.login_model.roll),
              SizedBox(height: 16),
              _buildInfoBox("Department", widget.login_model.dept),
              SizedBox(height: 16),
              _buildInfoBox("Email Id", widget.login_model.emailId),
              SizedBox(height: 30),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'),
                      ),
                      SizedBox(width: 100),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResultPage()),
                          );
                        },
                        child: Text('See Result'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
