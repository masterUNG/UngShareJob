// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ungsharejob/utility/my_constant.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFunc;
  final bool? obsecu;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFunc,
    this.obsecu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      height: 40,
      child: TextFormField(obscureText: obsecu ?? false,
        onChanged: changeFunc,
        style: MyConstant().h3Style(),
        decoration: InputDecoration(
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: Icon(
            iconData,
            color: MyConstant.dark,
          ),
          hintText: hint,
          hintStyle: MyConstant().h3Style(),
        ),
      ),
    );
  }
}
