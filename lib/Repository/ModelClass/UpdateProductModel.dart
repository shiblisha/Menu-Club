class UpdateProductModel {
  UpdateProductModel({
      this.success, 
      this.status, 
      this.payload,});

  UpdateProductModel.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  bool? success;
  String? status;
  Payload? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status'] = status;
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }

}

class Payload {
  Payload({
      this.data,});

  Payload.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.categoryId, 
      this.storeId, 
      this.isVeg, 
      this.isActive, 
      this.description, 
      this.price, 
      this.cookingTime, 
      this.imageUrl, 
      this.isRecommended, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    storeId = json['store_id'];
    isVeg = json['is_veg'];
    isActive = json['is_active'];
    description = json['description'];
    price = json['price'];
    cookingTime = json['cooking_time'];
    imageUrl = json['image_url'];
    isRecommended = json['is_recommended'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  int? categoryId;
  int? storeId;
  int? isVeg;
  int? isActive;
  String? description;
  int? price;
  String? cookingTime;
  String? imageUrl;
  int? isRecommended;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category_id'] = categoryId;
    map['store_id'] = storeId;
    map['is_veg'] = isVeg;
    map['is_active'] = isActive;
    map['description'] = description;
    map['price'] = price;
    map['cooking_time'] = cookingTime;
    map['image_url'] = imageUrl;
    map['is_recommended'] = isRecommended;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}