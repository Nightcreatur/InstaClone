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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldInput(
                        controller: _emailController,
                        hint: 'Email',
                        textType: TextInputType.emailAddress,
                        isPass: false),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldInput(
                        controller: _passWordController,
                        hint: 'Password',
                        textType: TextInputType.text,
                        isPass: true)
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
