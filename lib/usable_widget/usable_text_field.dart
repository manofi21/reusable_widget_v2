import 'package:flutter/material.dart';
import '../master_widget/master_text_field/master_text_field.dart';

class UsableTextField extends StatelessWidget {
  const UsableTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: MasterTextField(
        labelText: '',
        controller: TextEditingController(),
        value: 'Text Filled',
        hint: 'Hint',
        usePrefix: true,
        prefixWidget: const Icon(Icons.access_alarm),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
