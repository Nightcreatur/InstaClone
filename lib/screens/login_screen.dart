import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/widgets/text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SvgPicture.asset(
              'assets/images/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),

            TextFieldInput(
                controller: _emailController,
                hint: 'Email',
                textType: TextInputType.emailAddress,
                isPass: false),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
                controller: _passWordController,
                hint: 'Password',
                textType: TextInputType.text,
                isPass: true),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    )),
                child: const Text('LogIn'),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            // SizedBox(
            //   height: mq.height * .25,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Don't have a account?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "SignUp.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
