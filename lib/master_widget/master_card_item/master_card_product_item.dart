import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../master_button/master_primary_button.dart';

Widget buildProductItem(BuildContext context, int qty) {
  return InkWell(
    onTap: () {},
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 5,
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 20.w,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.accessibility_outlined)
                        // Image.network(
                        //   product.customStickerImage!,
                        //   width: 8.w,
                        //   height: 8.w,
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.accessibility_outlined)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "This Product!",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.black45,
                          fontWeight: FontWeight.w600),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    buildPriceWidget(),
                  ],
                ),
              )
            ],
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MasterPrimaryButton(
                  text: "Tambah",
                  callback: () {},
                  height: 24,
                  fontSize: 12,
                  isDisabled: qty == 0,
                ),
              ),
            ),
          ),
          if (qty == 0) ...{
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.7),
                child: Center(
                  child: Text(
                    'Stok Habis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          }
        ],
      ),
    ),
  );
}

Widget buildPriceWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Rp 5.000.000',
        style: TextStyle(
            color: Colors.black12, fontSize: 9.sp, fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        width: 9,
      ),
      Text(
        'Rp 2.000.000',
        style: TextStyle(
            color: Colors.black26,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.black,
            fontSize: 9.sp),
      ),
    ],
  );
}
