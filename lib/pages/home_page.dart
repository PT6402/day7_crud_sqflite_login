import 'package:day7_crud_sqflite_login/models/user_model.dart';
import 'package:day7_crud_sqflite_login/services/database_service.dart';
import 'package:day7_crud_sqflite_login/widgets/user_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DatabaseService();
  void _update({required UserModel user, required bool check}) {
    UserModel userModel = UserModel(
        id: user.id,
        name: user.name,
        password: user.password,
        address: user.address,
        isActive: check ? 0 : 1);
    db.updateUser(userModel);
    setState(() {});
  }

  void _delete(UserModel user) {
    db.deleteUser(user.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<List<UserModel>>(
        future: db.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            var listUser = snapshot.data!;

            if (listUser.isEmpty) {
              return const Text("no record");
            } else {
              return UserList(
                  users: listUser, onDeactive: _update, onDelete: _delete);
            }
          } else {
            return const Text("not found");
          }
        },
      ),
    );
  }
}
