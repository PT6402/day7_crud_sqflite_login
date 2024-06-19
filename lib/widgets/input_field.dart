import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? placeholder;
  const InputField(
      {super.key,
      required this.title,
      required this.controller,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                labelText: title,
                suffix: IconButton(
                  onPressed: () => controller.clear(),
                  icon: const Icon(Icons.clear),
                )),
          )
        ],
      ),
    );
  }
}
