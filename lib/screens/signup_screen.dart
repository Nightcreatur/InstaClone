import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/auth/auth_method.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/utils/utils.dart';
import 'package:insta/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passWordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _bioController = TextEditingController();
  Uint8List? _image;

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
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
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: 64,
                        child: Image.asset(
                          'assets/images/user.png',
                          color: Colors.white,
                        ),
                      ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: () {
                        selectImage();
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
                controller: _userNameController,
                hint: 'User Name',
                textType: TextInputType.text,
                isPass: false),
            const SizedBox(
              height: 24,
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
            TextFieldInput(
                controller: _bioController,
                hint: 'Bio',
                textType: TextInputType.text,
                isPass: false),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethod().signUpUser(
                    email: _emailController.text,
                    password: _passWordController.text,
                    userName: _userNameController.text,
                    bio: _bioController.text,
                    file: _image!);
                print(res);
              },
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
                child: const Text('SignUp'),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "SignIn.",
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
