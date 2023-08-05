import 'package:flutter/material.dart';
import 'package:reusable_widget_v2/master_widget/master_custom_paint/master_custom_paint.dart';
import 'package:reusable_widget_v2/master_widget/master_pop_detail_page/master_pop_detail_page.dart';
import 'package:reusable_widget_v2/theme/theme_data.dart';
import 'package:reusable_widget_v2/usable_widget/usable_grid_view_widget.dart';
import 'package:reusable_widget_v2/usable_widget/usable_radio_group_widget.dart';
import 'package:reusable_widget_v2/usable_widget/usable_text_field.dart';
import 'package:reusable_widget_v2/usable_widget/usable_text_field_with_row.dart';
import 'package:reusable_widget_v2/usable_widget_model/usable_bottom_sheet_radio_item_model.dart';

import 'master_widget/master_text_field/master_text_field.dart';
import 'package:sizer/sizer.dart';

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
        home: Sizer(builder: (context, orientation, deviceType) {
          return const MyHomePage(title: 'Flutter Demo Home Page');
        }));
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              UsableRadioGroupWidget(
                listItems: [
                  UsableBottomSheetRadioItemModel(key: '1', title: 'Option 1'),
                  UsableBottomSheetRadioItemModel(key: '2', title: 'Option 2'),
                ],
                onChange: (value) {
                  print('value : ${value?.title}');
                },
              ),
              const ReusableCustomPain(),
              usableGridViewWidget(context),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: MasterPopDetailPage<String>(
                  homeOptionPage: (
                    listValue, {
                    required void Function(String) onValueClicked,
                  }) {
                    return ListView.builder(
                      itemCount: listValue.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            onValueClicked(listValue[index]);
                          },
                          child: Text(
                            listValue[index],
                          ),
                        );
                      },
                    );
                  },
                  detailWidget: (clickedValue) {
                    return Material(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Text(clickedValue),
                      ),
                    );
                  },
                  listValue: const <String>['Salect One', 'Select Two'],
                ),
              )
            ],
          ),
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
