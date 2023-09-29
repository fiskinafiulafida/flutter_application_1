import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/datepicker.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/model/keuangan.dart';

import 'package:flutter_application_1/database/dbhelper.dart';

class PengeluaranScreen extends StatefulWidget {
  final Keuangan? keuangan;
  const PengeluaranScreen({Key? key, this.keuangan}) : super(key: key);
  @override
  State<PengeluaranScreen> createState() => _PengeluaranScreenState();
}

class _PengeluaranScreenState extends State<PengeluaranScreen> {
  var ketController = TextEditingController();
  var nominalController = TextEditingController();
  late DateTime _selectedDate;
  @override

  // kondisi date
  void _handleDateSelected(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void initState() {
    super.initState();
    if (widget.keuangan != null) {
      nominalController.text = widget.keuangan!.nominal.toString();
      ketController.text = widget.keuangan!.ket;
    }
  }

  void _saveIncomeData() async {
    final id = widget.keuangan?.id;
    final tanggal = _selectedDate.toIso8601String();
    final nominal = int.tryParse(nominalController.value.text) ?? 0;
    final ket = ketController.value.text;

    final keuangan = Keuangan(
      id: id,
      tanggal: tanggal,
      nominal: nominal,
      ket: ket,
      kategori: 'pemasukan',
    );

    await DatabaseHelper.addKeuangan(keuangan);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pemasukan Anda Berhasil Disimpan !!'),
      ),
    );
  }

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
              Container(
                  decoration: BoxDecoration(
                      // color: const Color(0xFFCAD2C5).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color(0xFF3E616B), width: 2.0)),
                  child: DatePicker(
                    onDateSelected: _handleDateSelected,
                  )),
              // Nominal
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: nominalController,
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
                  controller: ketController,
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
                        onPressed: () {
                          nominalController.clear();
                          ketController.clear();
                        },
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
                        onPressed: () {
                          _saveIncomeData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
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
            ],
          ),
        ));
  }
}
