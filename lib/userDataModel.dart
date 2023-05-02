class UserDataModel {
  List<Users>? users;

  UserDataModel({this.users});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  Users({required this.name, required this.id, required this.atype});

  String? name;
  String? id;
  String? atype;

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    atype = json['atype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['atype'] = this.atype;
    return data;
  }
}
