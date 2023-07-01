import 'dart:async';
import 'package:flutter/material.dart';

import '../master_widget/master_group_button_as_radio_btn/master_tile_radio_btn.dart';
import '../usable_widget_model/usable_bottom_sheet_radio_item_model.dart';

class BottomSheetRadio extends StatefulWidget {
  const BottomSheetRadio({
    Key? key,
    this.initialItem,
    this.listItems = const [],
    this.onChange,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    this.margin = const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  }) : super(key: key);

  final UsableBottomSheetRadioItemModel? initialItem;
  final List<UsableBottomSheetRadioItemModel> listItems;
  final FutureOr<void> Function(UsableBottomSheetRadioItemModel?)? onChange;

  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  State<BottomSheetRadio> createState() => _BottomSheetRadioState();
}

class _BottomSheetRadioState extends State<BottomSheetRadio> {
  UsableBottomSheetRadioItemModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    final listItem = widget.listItems;

    return ListBody(
      mainAxis: Axis.vertical,
      children: List.generate(
        listItem.length,
        (index) {
          return Container(
            decoration: circularGreyBorder,
            padding: widget.padding,
            margin: widget.margin,
            child: Row(
              children: [
                MasterButtonAsRadio(
                  value: index,
                  onChanged: (i) {
                    setState(
                      () {
                        final newValue = listItem[i];
                        if (widget.onChange != null &&
                            _selectedItem != newValue) {
                          widget.onChange!(newValue);
                          _selectedItem = newValue;
                        }
                      },
                    );
                  },
                  groupValue: _selectedItem == null
                      ? 0
                      : listItem.indexOf(_selectedItem!),
                  title: listItem[index].title ?? '',
                  desc: listItem[index].desc,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

BoxDecoration get circularGreyBorder {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
    border: Border.all(
      color: const Color(0xffDBE0E3),
    ),
  );
}
