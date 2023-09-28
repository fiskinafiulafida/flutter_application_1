import 'package:flutter/material.dart';
import 'package:flutter_application_1/methods/textField.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/database/databasehelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usrName = TextEditingController();
  final usrPass = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // untuk button login
  login() async {
    final db = DatabaseHelper();

    var result = await db.authentication(
        Users(usrName: usrName.text, usrPassword: usrPass.text));

    if (result) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Silahkan Cek Pass dan Username !!!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.supervised_user_circle),
        leadingWidth: 100,
        backgroundColor: Colors.blue,
        title: const Text("Sign In"),
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
                    login();
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
