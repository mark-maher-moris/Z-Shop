class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json["data"]);
  }
}

class HomeDataModel {
  List<BannerModel>? banners = [];
  List<ProductModel>? products = [];
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners?.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element) {
      products?.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  String? image;
  int? id;

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic? price;
  String? image;
  dynamic? discount;
  dynamic? oldPrice;
  bool? inCart;
  bool? inFavorites;
  String? name;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    discount = json['discount'];
    oldPrice = json['old_price'];
    inCart = json['in_cart'];
    inFavorites = json['inFavorites'] ?? false;
    name = json['name'];
  }
}
