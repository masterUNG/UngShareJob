import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungsharejob/utility/my_constant.dart';
import 'package:ungsharejob/utility/my_dialog.dart';
import 'package:ungsharejob/utility/my_process.dart';
import 'package:ungsharejob/widgets/show_button.dart';
import 'package:ungsharejob/widgets/show_form.dart';
import 'package:ungsharejob/widgets/show_icon_button.dart';
import 'package:ungsharejob/widgets/show_image.dart';
import 'package:ungsharejob/widgets/show_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var educations = MyConstant.educations;
  String? education;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppBar(),
      body: ListView(
        children: [
          createCenter(widget: newImage()),
          formName(),
          dropDownEducate(),
          formAddress(),
          formSpecial(),
          formEmail(),
          formPassword(),
          buttonCreateAccount(),
        ],
      ),
    );
  }

  Widget buttonCreateAccount() {
    return createCenter(
      widget: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 250,
        child: ShowButton(
          label: 'Create Account',
          pressFunc: () {},
        ),
      ),
    );
  }

  Widget formPassword() {
    return createCenter(
      widget: ShowForm(
        hint: 'Password :',
        iconData: Icons.lock_outline,
        changeFunc: (String string) {},
      ),
    );
  }

  Widget formEmail() {
    return createCenter(
      widget: ShowForm(
        hint: 'Email :',
        iconData: Icons.email_outlined,
        changeFunc: (String string) {},
      ),
    );
  }

  Widget formSpecial() {
    return createCenter(
      widget: ShowForm(
        hint: 'ความสามารถพิเศษ :',
        iconData: Icons.star_border_outlined,
        changeFunc: (String string) {},
      ),
    );
  }

  Widget formAddress() {
    return createCenter(
      widget: ShowForm(
        maxLine: 3,
        textInputType: TextInputType.multiline,
        hint: 'Address :',
        iconData: Icons.home_outlined,
        changeFunc: (String string) {},
      ),
    );
  }

  Widget dropDownEducate() {
    return createCenter(
        widget: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.only(top: 16),
      decoration: MyConstant().curveBorder(),
      width: 250,
      height: 40,
      child: DropdownButton<dynamic>(
        underline: const SizedBox(),
        hint: const ShowText(text: 'โปรดเลือกระดับการศึกษา'),
        value: education,
        items: educations
            .map(
              (e) => DropdownMenuItem(
                child: ShowText(text: e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (value) {
          education = value;
          setState(() {});
        },
      ),
    ));
  }

  Widget formName() {
    return createCenter(
      widget: ShowForm(
        hint: 'Display Name :',
        iconData: Icons.fingerprint,
        changeFunc: (String string) {},
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
          file == null
              ? const ShowImage(
                  path: 'images/avatar.png',
                )
              : CircleAvatar(radius: 125,
                  backgroundImage: FileImage(file!),
                ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ShowIconButton(
              size: 36,
              iconData: Icons.add_a_photo,
              pressFunc: () {
                MyDialog(context: context).normalDialog(
                  title: 'Source Image ?',
                  subTitle: 'Please Tap Camera or Gallery',
                  label1: 'Camera',
                  label2: 'Gallery',
                  pressFunc1: () async {
                    Navigator.pop(context);
                    await MyProcess()
                        .takePhoto(source: ImageSource.camera)
                        .then((value) {
                      setState(() {
                        file = value;
                      });
                    });
                  },
                  pressFunc2: () async {
                    Navigator.pop(context);
                    await MyProcess()
                        .takePhoto(source: ImageSource.gallery)
                        .then((value) {
                      setState(() {
                        file = value;
                      });
                    });
                  },
                );
              },
            ),
          ),
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
