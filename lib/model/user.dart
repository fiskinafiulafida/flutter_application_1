class Users {
  final String? usrId;
  final String usrName;
  final String usrPassword;

  Users({this.usrId, required this.usrName, required this.usrPassword});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        usrName: json['usrName'],
        usrPassword: json['usrPassword'],
      );

  Map<String, dynamic> toMap() {
    return {
      'usrId': usrId,
      'usrName': usrName,
      'usrPassword': usrPassword,
    };
  }
}
