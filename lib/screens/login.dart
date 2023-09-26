import 'package:flutter/material.dart';
import 'package:flutter_application_1/methods/textField.dart';
import 'package:flutter_application_1/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usrName = TextEditingController();
  final usrPass = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sign In'),
      // ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                child: Image.asset('assets/logo.jpeg'),
                width: 100,
                height: 100,
              ),
            ),
            UnderLineInputField(
              controller: usrName,
              hint: "Username",
              validator: (value) {
                if (value.isEmpty) {
                  return "Masukkan Username";
                }
                return null;
              },
            ),
            UnderLineInputField(
              controller: usrPass,
              hint: "Password",
              validator: (value) {
                if (value.isEmpty) {
                  return "Masukkan Password";
                }
                return null;
              },
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minWidth: size.width * .95,
                height: 60,
                color: Colors.blue,
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // function login
                  }
                }),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Apakah Kamu Memiliki Akun ? "),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text("Sign Up"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
