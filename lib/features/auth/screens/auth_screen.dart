import 'package:amazon_flutter/common/widgets/custom_button.dart';
import 'package:amazon_flutter/common/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

enum Auth { signUp, signIn }

class AuthScreen extends StatefulWidget {
  static const String routName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor:
                    _auth == Auth.signUp
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      setState(() {
                        _auth = val!;
                      });
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  color: GlobalVariables.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            _nameController,
                            "Name",
                            (val) {},
                          ),
                          CustomTextFormField(
                            _emailController,
                            "Email",
                            (val) {},
                          ),
                          CustomTextFormField(
                            _passwordController,
                            "Password",
                            (val) {},
                          ),
                          CustomButton(title: "Sign Up", onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ListTile(
                tileColor:
                    _auth == Auth.signIn
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Sign-In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      setState(() {
                        _auth = val!;
                      });
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  color: GlobalVariables.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            _emailController,
                            "Email",
                            (val) {},
                          ),
                          CustomTextFormField(
                            _passwordController,
                            "Password",
                            (val) {},
                          ),
                          CustomButton(title: "Sign In", onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
