import 'dart:convert';
import 'package:hive/hive.dart';

// Generating part file for Hive
part 'product_model.g.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

// Class representing the product model
@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  num? productCount;
  @HiveField(1)
  List<Product>? products;

  ProductModel({
    this.productCount,
    this.products,
  });

  // Factory method to create a ProductModel instance from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productCount: json["ProductCount"],
        products: json["Products"] == null
            ? []
            : List<Product>.from(
                json["Products"]!.map((x) => Product.fromJson(x))),
      );

  // Method to convert the ProductModel instance to JSON
  Map<String, dynamic> toJson() => {
        "ProductCount": productCount,
        "Products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

// Class representing a product details
@HiveType(typeId: 2)
class Product {
  @HiveField(0)
  String? season;
  @HiveField(1)
  String? brand;
  @HiveField(2)
  String? mood;
  @HiveField(3)
  String? gender;
  @HiveField(4)
  String? theme;
  @HiveField(5)
  String? category;
  @HiveField(6)
  String? name;
  @HiveField(7)
  String? color;
  @HiveField(8)
  String? option;
  @HiveField(9)
  num? mrp;
  @HiveField(10)
  String? subCategory;
  @HiveField(11)
  String? collection;
  @HiveField(12)
  String? fit;
  @HiveField(13)
  String? description;
  @HiveField(14)
  String? qrCode;
  @HiveField(15)
  String? looks;
  @HiveField(16)
  dynamic looksImageUrl;
  @HiveField(17)
  dynamic looksImage;
  @HiveField(18)
  String? fabric;
  @HiveField(19)
  Map<String, String>? ean;
  @HiveField(20)
  String? finish;
  @HiveField(21)
  List<String>? offerMonths;
  @HiveField(22)
  num? productClass;
  @HiveField(23)
  bool? romoted;
  @HiveField(24)
  bool? secondary;
  @HiveField(25)
  bool? deactivated;
  @HiveField(26)
  List<String>? availableSizes;
  @HiveField(27)
  String? material;
  @HiveField(28)
  String? quality;
  @HiveField(29)
  String? qrCode2;
  @HiveField(30)
  String? displayName;
  @HiveField(31)
  num? displayOrder;
  @HiveField(32)
  num? minQuantity;
  @HiveField(33)
  num? maxQuantity;
  @HiveField(34)
  String? qpsCode;
  @HiveField(35)
  dynamic demandType;
  @HiveField(36)
  String? image;
  @HiveField(37)
  dynamic imageUrl;
  @HiveField(38)
  dynamic imageUrl2;
  @HiveField(39)
  dynamic imageUrl3;
  @HiveField(40)
  dynamic imageUrl4;
  @HiveField(41)
  dynamic imageUrl5;
  @HiveField(42)
  dynamic imageUrl6;
  @HiveField(43)
  dynamic imageUrl7;
  @HiveField(44)
  dynamic imageUrl8;
  @HiveField(45)
  dynamic imageUrl9;
  @HiveField(46)
  dynamic imageUrl10;
  @HiveField(47)
  dynamic imageUrl11;
  @HiveField(48)
  dynamic imageUrl12;
  @HiveField(49)
  String? technology;
  @HiveField(50)
  String? imageAlt;
  @HiveField(51)
  dynamic technologyImage;
  @HiveField(52)
  dynamic technologyImageUrl;
  @HiveField(53)
  bool? isCore;
  @HiveField(54)
  num? minimumArticleQuantity;
  @HiveField(55)
  double? likeabilty;
  @HiveField(56)
  String? brandRank;

  Product({
    this.season,
    this.brand,
    this.mood,
    this.gender,
    this.theme,
    this.category,
    this.name,
    this.color,
    this.option,
    this.mrp,
    this.subCategory,
    this.collection,
    this.fit,
    this.description,
    this.qrCode,
    this.looks,
    this.looksImageUrl,
    this.looksImage,
    this.fabric,
    this.ean,
    this.finish,
    this.offerMonths,
    this.productClass,
    this.romoted,
    this.secondary,
    this.deactivated,
    this.availableSizes,
    this.material,
    this.quality,
    this.qrCode2,
    this.displayName,
    this.displayOrder,
    this.minQuantity,
    this.maxQuantity,
    this.qpsCode,
    this.demandType,
    this.image,
    this.imageUrl,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    this.imageUrl5,
    this.imageUrl6,
    this.imageUrl7,
    this.imageUrl8,
    this.imageUrl9,
    this.imageUrl10,
    this.imageUrl11,
    this.imageUrl12,
    this.technology,
    this.imageAlt,
    this.technologyImage,
    this.technologyImageUrl,
    this.isCore,
    this.minimumArticleQuantity,
    this.likeabilty,
    this.brandRank,
  });

  // Factory method to create a Product instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        season: json["Season"],
        brand: json["Brand"],
        mood: json["Mood"],
        gender: json["Gender"],
        theme: json["Theme"],
        category: json["Category"],
        name: json["Name"],
        color: json["Color"],
        option: json["Option"],
        mrp: json["MRP"],
        subCategory: json["SubCategory"],
        collection: json["Collection"],
        fit: json["Fit"],
        description: json["Description"],
        qrCode: json["QRCode"],
        looks: json["Looks"],
        looksImageUrl: json["LooksImageUrl"],
        looksImage: json["LooksImage"],
        fabric: json["Fabric"],
        ean: (json['EAN'] as Map<String, dynamic>).map((key, value) {
          return MapEntry(key, value as String);
        }),
        finish: json["Finish"],
        offerMonths: json["OfferMonths"] == null
            ? []
            : List<String>.from(json["OfferMonths"]!.map((x) => x)),
        productClass: json["ProductClass"],
        romoted: json["Romoted"],
        secondary: json["Secondary"],
        deactivated: json["Deactivated"],
        availableSizes: json["AvailableSizes"] == null
            ? []
            : List<String>.from(json["AvailableSizes"]!.map((x) => x)),
        material: json["Material"],
        quality: json["Quality"],
        qrCode2: json["QRCode2"],
        displayName: json["DisplayName"],
        displayOrder: json["DisplayOrder"],
        minQuantity: json["MinQuantity"],
        maxQuantity: json["MaxQuantity"],
        qpsCode: json["QPSCode"],
        demandType: json["DemandType"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        imageUrl2: json["ImageUrl2"],
        imageUrl3: json["ImageUrl3"],
        imageUrl4: json["ImageUrl4"],
        imageUrl5: json["ImageUrl5"],
        imageUrl6: json["ImageUrl6"],
        imageUrl7: json["ImageUrl7"],
        imageUrl8: json["ImageUrl8"],
        imageUrl9: json["ImageUrl9"],
        imageUrl10: json["ImageUrl10"],
        imageUrl11: json["ImageUrl11"],
        imageUrl12: json["ImageUrl12"],
        technology: json["Technology"],
        imageAlt: json["ImageAlt"],
        technologyImage: json["TechnologyImage"],
        technologyImageUrl: json["TechnologyImageUrl"],
        isCore: json["IsCore"],
        minimumArticleQuantity: json["MinimumArticleQuantity"],
        likeabilty: json["Likeabilty"]?.toDouble(),
        brandRank: json["BrandRank"],
      );
  // Method to convert the Product instance to JSON
  Map<String, dynamic> toJson() => {
        "Season": season,
        "Brand": brand,
        "Mood": mood,
        "Gender": gender,
        "Theme": theme,
        "Category": category,
        "Name": name,
        "Color": color,
        "Option": option,
        "MRP": mrp,
        "SubCategory": subCategory,
        "Collection": collection,
        "Fit": fit,
        "Description": description,
        "QRCode": qrCode,
        "Looks": looks,
        "LooksImageUrl": looksImageUrl,
        "LooksImage": looksImage,
        "Fabric": fabric,
        "EAN": ean,
        "Finish": finish,
        "OfferMonths": offerMonths,
        "ProductClass": productClass,
        "Romoted": romoted,
        "Secondary": secondary,
        "Deactivated": deactivated,
        "AvailableSizes": availableSizes == null
            ? []
            : List<dynamic>.from(availableSizes!.map((x) => x)),
        "Material": material,
        "Quality": quality,
        "QRCode2": qrCode2,
        "DisplayName": displayName,
        "DisplayOrder": displayOrder,
        "MinQuantity": minQuantity,
        "MaxQuantity": maxQuantity,
        "QPSCode": qpsCode,
        "DemandType": demandType,
        "Image": image,
        "ImageUrl": imageUrl,
        "ImageUrl2": imageUrl2,
        "ImageUrl3": imageUrl3,
        "ImageUrl4": imageUrl4,
        "ImageUrl5": imageUrl5,
        "ImageUrl6": imageUrl6,
        "ImageUrl7": imageUrl7,
        "ImageUrl8": imageUrl8,
        "ImageUrl9": imageUrl9,
        "ImageUrl10": imageUrl10,
        "ImageUrl11": imageUrl11,
        "ImageUrl12": imageUrl12,
        "Technology": technology,
        "ImageAlt": imageAlt,
        "TechnologyImage": technologyImage,
        "TechnologyImageUrl": technologyImageUrl,
        "IsCore": isCore,
        "MinimumArticleQuantity": minimumArticleQuantity,
        "Likeabilty": likeabilty,
        "BrandRank": brandRank,
      };
}
