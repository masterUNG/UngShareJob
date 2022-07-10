import 'package:flutter/material.dart';
import 'package:ungsharejob/states/create_account.dart';
import 'package:ungsharejob/utility/my_constant.dart';
import 'package:ungsharejob/widgets/show_button.dart';
import 'package:ungsharejob/widgets/show_form.dart';
import 'package:ungsharejob/widgets/show_text.dart';
import 'package:ungsharejob/widgets/show_text_button.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
          return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            decoration: MyConstant().bgBox(),
            child: Stack(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      FocusScope.of(context).requestFocus(FocusScopeNode()),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowText(
                          text: 'Job Shot',
                          textStyle: MyConstant().h1Style(),
                        ),
                        ShowForm(
                          hint: 'Email :',
                          iconData: Icons.email_outlined,
                          changeFunc: (String string) {},
                        ),
                        ShowForm(
                          obsecu: true,
                          hint: 'Password :',
                          iconData: Icons.lock_outline,
                          changeFunc: (String string) {},
                        ),
                        Container(
                          width: 250,
                          margin: const EdgeInsetsDirectional.only(top: 8),
                          child: ShowButton(
                            label: 'Login',
                            pressFunc: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: boxConstraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowText(text: 'Non Account ? '),
                        ShowTextButton(
                          label: 'Create Account',
                          pressFunc: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateAccount(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
