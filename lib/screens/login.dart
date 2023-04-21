// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:internship_fair/auth/auth_controller.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/screens/JobProfile.dart';
import 'package:internship_fair/screens/forgot_password.dart';
import 'package:internship_fair/screens/info.dart';
import 'package:motion_toast/motion_toast.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController sapidController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizefont = size.width * 0.04;

    void togglePasswordView() {
      setState(() {
        isHidden = !isHidden;
      });
    }

    void signIn(String sapid, String email, String password) async {
      if (formKey.currentState!.validate()) {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const JobProfile()));
        Loader.show(context, progressIndicator: CircularProgressIndicator(color: blackTeal));
        String status = '';

        try {
          status = await authController.login(email, password);
        } on Exception catch (e) {
          Loader.hide();
          print(e);
        }
        Loader.hide();

        if (status == "Success") {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => JobProfile())));
        } else {
          MotionToast.error(
                  height: 65,
                  borderRadius: 10,
                  // width: 400,
                  padding: EdgeInsets.zero,
                  title: Text(
                    "Incorrect user details",
                    style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  description: Text("Enter registered email and password"))
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
            return ("Please enter your Email ID");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]").hasMatch(value)) {
            return ("Please Enter a valid Email");
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
              signIn(sapidController.text, emailController.text, passwordController.text);
            },
            child: SizedBox(
              width: size.width,
              child: Text(
                "LOGIN",
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
                    "LOGIN",
                    style: TextStyle(fontFamily: 'alumni', color: blackTeal, fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text("New here? ", style: TextStyle(fontFamily: 'poppins', fontSize: sizefont)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InfoPage(),
                            ),
                          );
                        },
                        child: Text("Sign up Here",
                            style: TextStyle(
                                fontFamily: 'poppins', fontSize: sizefont, decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Text("SAPID",
                  //     style: TextStyle(fontFamily: 'poppins', fontSize: sizefont)),
                  // sapidField,
                  Text("Email ID", style: TextStyle(fontFamily: 'poppins', fontSize: sizefont)),
                  emailField,
                  Text("Password", style: TextStyle(fontFamily: 'poppins', fontSize: sizefont)),
                  passwordField,
                  const SizedBox(
                    height: 9,
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Text("Forgot Password?",
                            style: TextStyle(fontFamily: 'poppins', fontSize: sizefont, color: blackTeal)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
