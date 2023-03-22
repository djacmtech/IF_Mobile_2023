import 'package:flutter/material.dart';
import 'package:internship_fair/constants/constants.dart';
import 'package:internship_fair/screens/home.dart';
import 'package:internship_fair/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Size screen() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {

    void signUp(String name, String email, String password, String confirmPassword) async {
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }

    final nameField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: const TextStyle(fontSize: 17),
        autofocus: false,
        controller: fullnameController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your SAPID");
          }
          return null;
        },
        onSaved: (value) {
          fullnameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final emailField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: const TextStyle(fontSize: 17),
        autofocus: false,
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your E-mail ID");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid E-mail");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
        ),
      ),
    );

    final passwordField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: const TextStyle(fontSize: 17),
        obscureText: _isHidden,
        autofocus: false,
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your Password");
          }
          if (!RegExp(r'^.{8,}$').hasMatch(value)) {
            return ("Please enter a valid Password");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final confirmPasswordField = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: const TextStyle(fontSize: 17),
        obscureText: _isHidden,
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
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: blackTeal, width: 2.0)),
          isDense: true,
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final signupButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: blackTeal,
        child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 20),
            onPressed: () {
              signUp(fullnameController.text, emailController.text, passwordController.text,
              confirmpasswordController.text);
            },
            child: SizedBox(
              width: screen().width,
              child: Text(
                "SIGN UP",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 18, color: whiteColor),
              ),
            )));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: screen().height * 0.05,
              left: screen().width * 0.08,
              right: screen().width * 0.08,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 40,
                    // ),
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontFamily: 'alumni',
                        color: blackTeal,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: const Text("Already have an Account? Login Here",
                          style:
                              TextStyle(fontFamily: 'poppins', fontSize: 17)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Full Name",
                        style:
                            TextStyle(fontFamily: 'poppins', fontSize: 17)),
                    nameField,
                    const Text("E-mail ID",
                        style:
                            TextStyle(fontFamily: 'poppins', fontSize: 17)),
                    emailField,
                    const Text("Password",
                        style:
                            TextStyle(fontFamily: 'poppins', fontSize: 17)),
                    passwordField,
                    const Text("Confirm Password",
                        style:
                            TextStyle(fontFamily: 'poppins', fontSize: 17)),
                    confirmPasswordField,
                    const SizedBox(
                      height: 12,
                    ),
                    signupButton,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}