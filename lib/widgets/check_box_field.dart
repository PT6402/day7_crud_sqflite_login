import 'package:flutter/material.dart';

class CheckBoxField extends StatelessWidget {
  final bool isChecked;
  final Function? onCheckActive;
  const CheckBoxField(
      {super.key, required this.onCheckActive, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("DeActive"),
          Checkbox(
              value: isChecked, onChanged: (check) => onCheckActive!(check))
        ],
      ),
    );
  }
}
