import 'package:flutter/material.dart';
import 'package:ungsharejob/utility/my_constant.dart';
import 'package:ungsharejob/widgets/show_icon_button.dart';
import 'package:ungsharejob/widgets/show_image.dart';
import 'package:ungsharejob/widgets/show_text.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppBar(),
      body: ListView(
        children: [
          createCenter(widget: newImage()),
        ],
      ),
    );
  }

  Widget createCenter({required Widget widget}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [widget],
      );

  Container newImage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 250,
      height: 250,
      child: Stack(
        children: [
          ShowImage(
            path: 'images/avatar.png',
          ),
          ShowIconButton(iconData: Icons.add_a_photo, pressFunc: (){},),
        ],
      ),
    );
  }

  AppBar newAppBar() {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: 'Create New Account',
        textStyle: MyConstant().h2Style(),
      ),
      backgroundColor: Colors.white,
      foregroundColor: MyConstant.dark,
      elevation: 0,
    );
  }
}
