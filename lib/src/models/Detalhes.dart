class Detalhes {
  String? about;
  double? fee;

  Detalhes({this.about, this.fee});

  Detalhes.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['fee'] = this.fee;
    return data;
  }
}
