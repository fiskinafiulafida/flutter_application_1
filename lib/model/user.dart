class Users {
  const Users({this.id, required this.username, required this.password});

  final int? id;
  final String username;
  final String password;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json['id'], username: json['username'], password: json['password']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'password': password};
}
