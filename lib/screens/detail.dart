import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/keuangan.dart';
import 'package:flutter_application_1/database/dbhelper.dart';

class DetailScreen extends StatefulWidget {
  final Keuangan? keuangan;
  const DetailScreen({Key? key, this.keuangan}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<List<Keuangan>?> getDataFromDatabase() async {
    final keuangans = await DatabaseHelper.getAllKeuangan();
    return keuangans;
  }

  List<Keuangan>? keuanganList;
  @override
  void initState() {
    super.initState();
    getDataFromDatabase().then((result) {
      setState(() {
        keuanganList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Cashflow'),
      ),
      body: ListView.builder(
          itemCount: keuanganList?.length ?? 0,
          itemBuilder: ((context, index) {
            final keuangans = keuanganList![index];
            Color iconColor =
                keuangans.kategori == 'pengeluaran' ? Colors.red : Colors.green;
            IconData iconArrow = keuangans.kategori == 'pemasukan'
                ? Icons.arrow_back_rounded
                : Icons.arrow_forward_rounded;
            String tanda = keuangans.kategori == 'pemasukan' ? '+' : '-';
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '[ ${tanda} ] Rp ${keuangans.nominal}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2B4856)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          keuangans.ket,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2B4856)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '${DateTime.parse(keuangans.tanggal).day}-${DateTime.parse(keuangans.tanggal).month}-${DateTime.parse(keuangans.tanggal).year}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2B4856).withOpacity(0.5)),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          keuangans.kategori,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2B4856).withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    iconArrow,
                    size: 45,
                    color: iconColor,
                  )
                ],
              ),
            );
          })),
    );
  }
}
