// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungsharejob/utility/my_constant.dart';
import 'package:ungsharejob/widgets/show_image.dart';
import 'package:ungsharejob/widgets/show_text.dart';
import 'package:ungsharejob/widgets/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void normalDialog({
    required String title,
    required String subTitle,
    String? label1,
    String? label2,
    Function()? pressFunc1,
    Function()? pressFunc2,
    String? pathImage,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: SizedBox(
            child: ShowImage(
              path: pathImage ?? 'images/logo.png',
            ),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(text: subTitle),
        ),
        actions: [
          label1 == null
              ? const SizedBox()
              : ShowTextButton(label: label1, pressFunc: pressFunc1!),
          label2 == null
              ? const SizedBox()
              : ShowTextButton(label: label2, pressFunc: pressFunc2!),
          ShowTextButton(
            label: 'Cancel',
            pressFunc: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
} // end Class
