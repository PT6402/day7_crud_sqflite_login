import 'package:day7_crud_sqflite_login/models/user_model.dart';
import 'package:day7_crud_sqflite_login/widgets/check_box_field.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;
  final Function({required UserModel user, required bool check}) onDeactive;
  final Function(UserModel user)? onDelete;
  const UserList(
      {super.key,
      required this.users,
      required this.onDeactive,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.titleMedium;
    return GridView.builder(
      itemCount: users.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        UserModel user = users[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("images/d2.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          user.name.toString(),
                          style: textTheme,
                        ),
                        TextButton(
                            onPressed: () {
                              onDelete!(user);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red[500],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10)),
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
                CheckBoxField(
                    onCheckActive: (check) =>
                        onDeactive(user: user, check: check),
                    isChecked: user.isActive == 0),
              ],
            ),
          ),
        );
      },
    );
  }
}
