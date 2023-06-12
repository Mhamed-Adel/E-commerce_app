
class SpecialOffersModel {
  String? image;
  String? title;
  String? textButton;
  SpecialOffersModel({
    required this.image,
    required this.title,
    required this.textButton,
  });
}

var models = [
  SpecialOffersModel(
    image: 'assets/images/product1.png', 
    title: 'title1', 
    textButton: 'textButton1'),
  SpecialOffersModel(
    image: 'assets/images/product1.png', 
    title: 'title2', 
    textButton: 'textButton2'),
  SpecialOffersModel(
    image: 'assets/images/product1.png', 
    title: 'title3', 
    textButton: 'textButton3'),
];

class CategoryModel{
   final String image;
   final String text;

  CategoryModel(
   {
  required this.image,
   required this.text});
  
  
}

var catModel = [
  CategoryModel(image: 'assets/images/Group.png', text: 'Armchair'),
  CategoryModel(image: 'assets/images/Group.png', text: 'Sofa'),
  CategoryModel(image: 'assets/images/Group.png', text: 'Bed'),
  CategoryModel(image: 'assets/images/Group.png', text: 'Chair'),
  CategoryModel(image: 'assets/images/Group.png', text: 'Armchair'),
  ];


  class TopTrendModel {
  late final  String image;
  late final  String name;
  late final  String price;
  late final  String discount;
  TopTrendModel({
    required this.image,
    required this.name,
    required this.price,
    required this.discount,
  });
  }

  List<TopTrendModel> topTrendModel = [
    TopTrendModel(
      image: 'assets/images/chair.png', 
      name: 'Tortor Chair \n Modern Style', 
      price: '230', 
      discount: '32% OFF'),
    TopTrendModel(
      image: 'assets/images/chair.png', 
      name: 'Tortor Chair \n Modern Style', 
      price: '230', 
      discount: '32% OFF'),
    TopTrendModel(
      image: 'assets/images/chair.png', 
      name: 'Tortor Chair \n Modern Style', 
      price: '230', 
      discount: '32% OFF'),
  ];