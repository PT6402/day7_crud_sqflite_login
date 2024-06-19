import 'package:day7_crud_sqflite_login/models/user_model.dart';
import 'package:day7_crud_sqflite_login/services/database_service.dart';
import 'package:day7_crud_sqflite_login/widgets/input_field.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var db = DatabaseService();
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  final TextEditingController _txtAddress = TextEditingController();
  void _addUser() {
    UserModel newUser = UserModel(
        name: _txtName.text,
        password: _txtPassword.text,
        address: _txtAddress.text);
    db.addUser(newUser);

    _txtName.clear();
    _txtPassword.clear();
    _txtAddress.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Form(
          child: Column(
            children: [
              InputField(title: "Name", controller: _txtName),
              InputField(title: "Password", controller: _txtPassword),
              InputField(title: "Address", controller: _txtAddress),
              TextButton(
                onPressed: _addUser,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 20)),
                child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
