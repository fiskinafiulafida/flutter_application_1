import 'package:flutter/material.dart';
import 'package:flutter_application_1/methods/textField.dart';
import 'package:flutter_application_1/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterScreen> {
  final usrName = TextEditingController();
  final usrPass = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.supervised_user_circle),
        leadingWidth: 100,
        backgroundColor: Colors.blue,
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                child: Image.asset('assets/lingkaran.jpg'),
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "My Fintech",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black12,
                  fontSize: 25.0),
            ),
            SizedBox(
              height: 30.0,
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
                Text("Anda Telah Melakukan Pendaftaran ? "),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("Sign In"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
