class Keuangan {
  const Keuangan(
      {this.id,
      required this.tanggal,
      required this.nominal,
      required this.ket,
      required this.kategori});

  final int? id;
  final String tanggal;
  final int? nominal;
  final String ket;
  final String kategori;

  factory Keuangan.fromJson(Map<String, dynamic> json) => Keuangan(
        id: json['id'],
        tanggal: json['tanggal'],
        nominal: json['nominal'],
        ket: json['ket'],
        kategori: json['kategori'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tanggal': tanggal,
        'nominal': nominal,
        'ket': ket,
        'kategori': kategori
      };
}
