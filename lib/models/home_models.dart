class HomeModel{
  bool status = false;
  HomeDataModel? data ;
  String? message;
  HomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = json['data'] != null ? HomeDataModel.fromJson(json['data']): null;
  }
}

class HomeDataModel {
  List<BannerModel>? banners;
  List<ProductModel>? products ;
  HomeDataModel.fromJson(Map<String,dynamic> json){
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners!.add(BannerModel.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }
}

class BannerModel{
  int? id;
  String? image ;
  BannerModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}
class ProductModel {
  int? id;
  dynamic price ;
  dynamic oldPrice ;
  dynamic discount ;
  String? image;
  String? name ;
  bool? inFavorites ;
  bool? inCart ;

  ProductModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}