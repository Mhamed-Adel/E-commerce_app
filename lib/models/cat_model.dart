// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoriesModel {
  bool? status;
  String? message;
  CatData? data;
  CategoriesModel({
    this.status,
    this.message,
    this.data,
  });


  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  CatData.fromJson(json['data']) : null;
  }


}

class CatData {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;
  CatData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    required this.nextPageUrl,
    this.path,
    this.perPage,
    required this.prevPageUrl,
    this.to,
    this.total,
  });


  CatData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }}

class Data {
  int? id;
  String? name;
  dynamic image;
  Data({
    this.id,
    this.name,
    required this.image,
  });

  

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  
}
