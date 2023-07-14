// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddressDataModel {
   String? name;
   String? city;
   String? region;
   String? details;
  String? notes;
  dynamic latitude;
  dynamic longitude;
   int? id;
  
  AddressDataModel({
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
    this.id,
  });



  AddressDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notes = json['notes'];
    id = json['id'];
  }
}
