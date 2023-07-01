import 'package:flutter/material.dart';

import 'model/tile_radio_model.dart';

class MasterButtonAsRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  final TileRadioModel? radioSelectedStyle;
  final TileRadioModel? radioInitalStyle;

  final String title;
  final String? desc;

  const MasterButtonAsRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.radioSelectedStyle,
    this.radioInitalStyle,
    required this.title,
    this.desc,
  }) : super(key: key);

  @override
  State<MasterButtonAsRadio> createState() => _MasterButtonAsRadioState();
}

class _MasterButtonAsRadioState extends State<MasterButtonAsRadio> {
  @override
  Widget build(BuildContext context) {
    final radioStyle = widget.value == widget.groupValue
        ? widget.radioSelectedStyle ?? TileRadioModel.selected()
        : widget.radioInitalStyle ?? TileRadioModel.initial();

    return Row(
      children: [
        InkWell(
          onTap: () => widget.onChanged(widget.value),
          child: Container(
            margin: radioStyle.marginRadio,
            padding: radioStyle.paddingRadio,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: radioStyle.color,
            ),
            child: Icon(
              Icons.circle,
              size: radioStyle.size,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TitleTile(title: widget.title, desc: widget.desc)
      ],
    );
  }
}

class TitleTile extends StatelessWidget {
  const TitleTile({Key? key, required this.title, this.desc}) : super(key: key);
  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff101315),
          ),
        ),
        if ((desc ?? '').isNotEmpty) ...{
          TextSpan(
            text: "\n$desc",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff414B54),
            ),
          )
        }
      ]),
    );
  }
}
