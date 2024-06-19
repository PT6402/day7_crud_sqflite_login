import 'package:day7_crud_sqflite_login/pages/main_page.dart';
import 'package:day7_crud_sqflite_login/services/database_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final db = DatabaseService();
  final txName = TextEditingController();
  final txPass = TextEditingController();

  void _checkLogin() {
    db.checkLogin(txName.text, txPass.text).then((value) => {
          if (value != null && value)
            {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => MainPage(title: txName.text)),
                (Route<dynamic> route) => false,
              )
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("user not found or deActive")))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 65),
          child: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Login Page",
                          style: Theme.of(context).textTheme.displaySmall),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 5,
                            ),
                            child: TextFormField(
                              controller: txName,
                              decoration: const InputDecoration(
                                labelText: "enter your name",
                                hintText: "Your name...",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 5,
                            ),
                            child: TextFormField(
                              controller: txPass,
                              decoration: const InputDecoration(
                                labelText: "enter your pass",
                                hintText: "Your pass...",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _checkLogin,
                            child: const Text("Login"),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
