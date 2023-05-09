class CategoryModel {
  CategoryModel({
      this.success, 
      this.status, 
      this.payload,});

  CategoryModel.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  bool? success;
  dynamic status;
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
      this.imageUrl, 
      this.isActive, 
      this.storeId, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    isActive = json['is_active'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  dynamic id;
  dynamic name;
  dynamic imageUrl;
  dynamic isActive;
  dynamic storeId;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image_url'] = imageUrl;
    map['is_active'] = isActive;
    map['store_id'] = storeId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}