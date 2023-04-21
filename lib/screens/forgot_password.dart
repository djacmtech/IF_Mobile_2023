// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:internship_fair/auth/auth_controller.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/info.dart';
import 'package:motion_toast/motion_toast.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isHidden = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController sapidController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  AuthController authController = AuthController();
  bool _isHidden2 = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    void togglePasswordView() {
      setState(() {
        isHidden = !isHidden;
      });
    }

    void resetPassword(String email, String password, String confirmPassword) async {
      if (formKey.currentState!.validate()) {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const JobProfile()));
        Loader.show(context, progressIndicator: CircularProgressIndicator(color: blackTeal));
        String status = '';

        try {
          status = await authController.resetPassword(email, password, confirmPassword);
        } on Exception catch (e) {
          Loader.hide();
          print(e);
        }
        Loader.hide();

        if (status == "password changed successfully") {
          Navigator.pop(context);
          MotionToast.success(
            width: size.width * 0.7,
            height: 65,
            borderRadius: 10,
            padding: EdgeInsets.zero,
            title: Text(
              "Password changed",
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            description: Text(
              "Your password has been reset",
              style: TextStyle(
                color: Colors.white,
                fontSize: sizefont * 0.7,
              ),
            ),
          ).show(context);
        } else {
          MotionToast.error(
                  height: 65,
                  borderRadius: 10,
                  // width: 400,
                  padding: EdgeInsets.zero,
                  title: Text(
                    "User not found",
                    style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  description: Text("Please enter valid email"))
              .show(context);
        }
        // authController.login(email, password);
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return const JobProfile();
        // }));
      }
    }

    final sapidField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: sizefont),
        autofocus: false,
        controller: sapidController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your SAPID");
          }
          if (!RegExp(r"^[0-9]{11}$").hasMatch(value)) {
            return ("Please Enter a valid SAPID");
          }
          return null;
        },
        onSaved: (value) {
          sapidController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // labelText: 'SAPID',
          // labelStyle: TextStyle(
          //   fontFamily: 'poppins',
          //   color: textgreen,
          //   fontSize: sizefont,
          // ),
          suffixIcon: sapidController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: Icon(
                    Icons.close,
                    size: sizefont,
                  ),
                  onPressed: () => sapidController.clear(),
                ),
          contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.01, horizontal: size.width * 0.03),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final emailField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: TextStyle(fontSize: sizefont),
        autofocus: false,
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your E-mail ID");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]").hasMatch(value)) {
            return ("Please Enter a valid E-mail");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // labelText: 'Email-ID',
          // labelStyle: TextStyle(
          //   fontFamily: 'poppins',
          //   color: textgreen,
          //   fontSize: sizefont,
          // ),
          suffixIcon: emailController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: Icon(
                    Icons.close,
                    size: sizefont,
                  ),
                  onPressed: () => emailController.clear(),
                ),
          contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.005, horizontal: size.width * 0.03),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final passwordField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: TextStyle(fontSize: sizefont),
        obscureText: isHidden,
        autofocus: false,
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter your Password");
          }
          if (!RegExp(r'^.{8,}$').hasMatch(value)) {
            return ("Please Enter a valid Password");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
          suffixIcon: InkWell(
            onTap: togglePasswordView,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final orRow = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          //flex: 1,
          fit: FlexFit.tight,
          child: Container(
            //width: width/2,
            height: 2,
            color: greyColor,
          ),
        ),
        const SizedBox(
          width: 5,
          height: 2,
        ),
        Text("OR",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'poppins', fontSize: sizefont * 0.8, color: greyColor)),
        const SizedBox(
          width: 5,
          height: 2,
        ),
        Flexible(
          //flex: 1,
          fit: FlexFit.tight,
          child: Container(
            //width: width/2,
            height: 2,
            color: greyColor,
          ),
        ),
      ],
    );

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackTeal,
        child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: sizefont * 0.7),
            onPressed: () {
              resetPassword(emailController.text, passwordController.text, confirmpasswordController.text);
            },
            child: SizedBox(
              width: size.width,
              child: Text(
                "SUBMIT",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: whiteColor),
              ),
            )));

    final loginButton2 = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackColor,
        child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: sizefont * 0.7),
            onPressed: () {
              // signIn(sapidController.text, emailController.text, passwordController.text);
            },
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child:
                          SizedBox(height: sizefont, child: Image.asset("assets/images/Google.png", fit: BoxFit.contain)
                              // SvgPicture.asset("assets/images/google.svg")
                              ),
                    ),
                    Flexible(
                      flex: 0,
                      fit: FlexFit.tight,
                      child: Container(
                        width: 10,
                      ),
                    ),
                    Flexible(
                      flex: 1, fit: FlexFit.loose,
                      // child:
                      // SizedBox(
                      child: Text(
                        "Login with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: whiteColor),
                      ),
                    ),
                    // ),
                  ]),
            )));

    final confirmPasswordField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: TextStyle(fontSize: sizefont),
        obscureText: _isHidden2,
        autofocus: false,
        controller: confirmpasswordController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please confirm your Password");
          }
          if (value != passwordController.text) {
            return 'The password does not match';
          }
          return null;
        },
        onSaved: (value) {
          confirmpasswordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isHidden2 = !_isHidden2;
              });
            },
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  _isHidden2 ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 27, horizontal: size.width * 0.06),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "RESET PASSWORD",
                    style: TextStyle(fontFamily: 'alumni', color: blackTeal, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  // Row(
                  //   children: [
                  //     Text("New here? ", style: TextStyle(fontFamily: 'poppins', fontSize: sizefont)),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const InfoPage(),
                  //           ),
                  //         );
                  //       },
                  //       child: Text("Sign up Here",
                  //           style: TextStyle(
                  //               fontFamily: 'poppins', fontSize: sizefont, decoration: TextDecoration.underline)),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Text("SAPID",
                  //     style: TextStyle(fontFamily: 'poppins', fontSize: sizefont)),
                  // sapidField,
                  Text("Email ID", style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: textgreen)),
                  emailField,
                  Text("Password", style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: textgreen)),
                  passwordField,
                  const SizedBox(
                    height: 9,
                  ),
                  Text("Confirm Password",
                      style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: textgreen)),
                  confirmPasswordField,
                  const SizedBox(
                    height: 25,
                  ),
                  loginButton,
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // orRow,
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // loginButton2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
