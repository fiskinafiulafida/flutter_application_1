import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/database/databasehelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> _login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    final userLogin = Users(username: "admin", password: "admin");
    await DatabaseHelper.addUser(userLogin);

    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Username dan password tidak boleh kosong.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final user = await DatabaseHelper.loginUser(username, password);

    if (user != null) {
      // Jika login berhasil, navigasikan ke halaman beranda (HomeScreen)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // Jika login gagal, tampilkan pesan error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Username atau password salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.supervised_user_circle),
        leadingWidth: 100,
        backgroundColor: Colors.blue,
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: Form(
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter valid username'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 60,
                color: Colors.blue,
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _login();
                }),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Apakah Kamu Memiliki Akun ? "),
                TextButton(onPressed: () {}, child: Text("Sign Up"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
