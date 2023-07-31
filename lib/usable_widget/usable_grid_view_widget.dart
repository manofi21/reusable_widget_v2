import 'package:flutter/material.dart';
import 'package:reusable_widget_v2/master_widget/master_card_item/master_card_item.dart';

import '../master_widget/master_card_item/master_card_product_item.dart';
import '../master_widget/master_grid_view/master_grid_view.dart';

Widget usableGridViewWidget(BuildContext context) {
  return MasterGridView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // Container(
        //   color: Colors.purple,
        // ),
        // MasterCardItem(),
        // MasterCardItem(),
        const MasterCardItem(),
        const MasterCardItem(),
        buildProductItem(context, 2),
        buildProductItem(context, 0),
      ],
    );
}