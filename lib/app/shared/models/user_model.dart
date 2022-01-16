class UserModel {
  String? email;
  String? cpf;

  UserModel({this.email, this.cpf});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['cpf'] = cpf;
    return data;
  }
}