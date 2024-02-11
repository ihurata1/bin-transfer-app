class LocationModel {
  String? company;
  String? location;

  LocationModel({this.company, this.location});

  LocationModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['location'] = this.location;
    return data;
  }
}
