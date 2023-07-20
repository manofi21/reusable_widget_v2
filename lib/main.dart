import 'package:flutter/material.dart';
import 'package:reusable_widget_v2/master_widget/master_custom_paint/master_custom_paint.dart';
import 'package:reusable_widget_v2/theme/theme_data.dart';
import 'package:reusable_widget_v2/usable_widget/usable_bottom_sheet_radio_item.dart';
import 'package:reusable_widget_v2/usable_widget/usable_text_field.dart';
import 'package:reusable_widget_v2/usable_widget/usable_text_field_with_row.dart';
import 'package:reusable_widget_v2/usable_widget_model/usable_bottom_sheet_radio_item_model.dart';

import 'master_widget/master_text_field/master_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController(text: 'Text Filled');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: MasterTextField.initRoundedFalue(),
            ),
            const SizedBox(height: 10),
            // 1. Usabe TextField
            const UsableTextField(),
            const SizedBox(height: 10),
            // 1.b Usabe TextField
            const UsableTextFieldWithRow(),
            const SizedBox(height: 10),
            BottomSheetRadio(
              listItems: [
                UsableBottomSheetRadioItemModel(key: '1', title: 'Option 1'),
                UsableBottomSheetRadioItemModel(key: '2', title: 'Option 2'),
              ],
              onChange: (value) {
                print('value : ${value?.title}');
              },
            ),
            const ReusableCustomPain(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
