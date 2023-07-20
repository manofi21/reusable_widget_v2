import 'package:flutter/material.dart';

import '../master_widget/master_text_field/master_text_field.dart';

class UsableTextFieldWithRow extends StatelessWidget {
  const UsableTextFieldWithRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.access_alarm),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MasterTextField(
                labelText: '',
                controller: TextEditingController(),
                hint: 'Hint',
                border: InputBorder.none,
                textAlignVertical: -.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
