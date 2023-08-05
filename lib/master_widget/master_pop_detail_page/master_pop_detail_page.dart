import 'package:flutter/material.dart';

class MasterPopDetailPage<S> extends StatefulWidget {
  final Widget Function(List<S>, {required void Function(S) onValueClicked})
      homeOptionPage;
  final Widget Function(S) detailWidget;
  final List<S> listValue;
  const MasterPopDetailPage(
      {super.key,
      required this.homeOptionPage,
      required this.detailWidget,
      required this.listValue});

  @override
  State<MasterPopDetailPage<S>> createState() => _MasterPopDetailPageState<S>();
}

class _MasterPopDetailPageState<S> extends State<MasterPopDetailPage<S>> {
  bool _show = false;
  late S currentValue;
 
  void onItemClicked(S choosedValue) {
    _show = true;
    setState(() {});
    currentValue = choosedValue;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: _show
            ? Draggable(
                onDragEnd: (details) {
                  if (details.offset.dx > 100 ||
                      details.offset.dx < -100 ||
                      details.offset.dy > 100 ||
                      details.offset.dy < -100) {
                    setState(() {
                      _show = false;
                    });
                  }
                },
                feedback: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    height: mq.height,
                    width: mq.width,
                    child: currentValue != null ? widget.detailWidget(currentValue!) :Container() ,
                  ),
                ),
                childWhenDragging: widget.homeOptionPage(
                  widget.listValue,
                  onValueClicked: onItemClicked,
                ),
                child: currentValue != null ? widget.detailWidget(currentValue!) : Container(),
              )
            : widget.homeOptionPage(
                widget.listValue,
                onValueClicked: onItemClicked,
              ),
      ),
    );
  }
}
