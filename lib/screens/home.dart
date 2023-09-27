import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detail.dart';
import 'package:flutter_application_1/screens/pemasukan.dart';
import 'package:flutter_application_1/screens/pengaturan.dart';
import 'package:flutter_application_1/screens/pengeluaran.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Dashboard"),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PemasukanScreen(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.home,
                    size: 75,
                    color: Colors.blue,
                  ),
                  Text(
                    "Tambah Pemasukan",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              )),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PengeluaranScreen(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.inbox,
                    size: 75,
                    color: Colors.blue,
                  ),
                  Text(
                    "Tambah Pengeluaran",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              )),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.inbox,
                    size: 75,
                    color: Colors.blue,
                  ),
                  Text(
                    "Detail Cash Flow",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              )),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PengaturanScreen(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.settings,
                    size: 75,
                    color: Colors.blue,
                  ),
                  Text(
                    "Pengaturan",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
