class BinModel {
  String? size;
  String? location;
  String? number;
  String? delivaredDate;
  String? state;

  BinModel({this.size, this.location, this.number, this.delivaredDate, this.state});

  BinModel.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    location = json['location'];
    number = json['number'];
    delivaredDate = json['delivaredDate'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['location'] = this.location;
    data['number'] = this.number;
    data['delivaredDate'] = this.delivaredDate;
    data['state'] = this.state;
    return data;
  }
}
