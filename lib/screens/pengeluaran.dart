import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class PengeluaranScreen extends StatefulWidget {
  const PengeluaranScreen({super.key});

  @override
  State<PengeluaranScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PengeluaranScreen> {
  TextEditingController dateInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.account_circle_rounded),
          leadingWidth: 100,
          backgroundColor: Colors.blue,
          title: const Text("Create Pengeluaran"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // Tanggal
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Tanggal',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                  ),
                  controller: dateInputController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));

                    if (pickedDate != null) {
                      dateInputController.text = pickedDate.toString();
                    }
                  },
                ),
              ),
              // Nominal
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.money),
                    labelText: 'Nominal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              // keterangan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.book),
                    labelText: 'Keterangan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              // tombol reset
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        minWidth: double.maxFinite, // set minWidth to maxFinite
                        color: Colors.orange,
                        onPressed: () {},
                        child: Text("RESET",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.8))),
                      ),
                    )
                  ],
                ),
              ),
              // tombol simpan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        minWidth: double.maxFinite, // set minWidth to maxFinite
                        color: Colors.green,
                        onPressed: () {},
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
            ],
          ),
        ));
  }
}
