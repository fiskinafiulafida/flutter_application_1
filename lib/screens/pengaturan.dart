import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class PengaturanScreen extends StatefulWidget {
  const PengaturanScreen({super.key});

  @override
  State<PengaturanScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PengaturanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.settings_applications),
          leadingWidth: 100,
          backgroundColor: Colors.blue,
          title: const Text("Pengaturan"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // Password Old
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.password_outlined),
                    labelText: 'Password Old',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              // Password New
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: 'Password New',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              // tombol save
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        minWidth: double.maxFinite, // set minWidth to maxFinite
                        color: Colors.green,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        child: Text("SAVE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.8))),
                      ),
                    ),
                  ],
                ),
              ),
              // tombol kembali
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        minWidth: double.maxFinite, // set minWidth to maxFinite
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        child: Text("BACK",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.8))),
                      ),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Image.asset('assets/lingkaran.jpg'),
                  width: 100,
                  height: 100,
                ),
                Container(
                  child: Text(
                    '2141764140_FiskiyaNafiulA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
