class LoginModel {
  LoginModel({
      this.success, 
      this.status, 
      this.payload,});

  LoginModel.fromJson(dynamic json) {
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
      this.user, 
      this.accessToken, 
      this.tokenType, 
      this.expiresIn,});

  Payload.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
  User? user;
  String? accessToken;
  String? tokenType;
  String? expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.email, 
      this.storeName, 
      this.logoUrl, 
      this.address, 
      this.description, 
      this.phone, 
      this.themeId, 
      this.subscriptionEndDate, 
      this.isVisible, 
      this.addBy, 
      this.viewId, 
      this.createdAt, 
      this.updatedAt, 
      this.isAcceptOrder, 
      this.currencySymbol, 
      this.serviceCharge, 
      this.tax, 
      this.tableEnable, 
      this.searchEnable, 
      this.languageEnable, 
      this.whatsappbuttonEnable, 
      this.diningEnable, 
      this.deliveryEnable, 
      this.takeawayEnable, 
      this.fssaiNo, 
      this.kycVerified, 
      this.isCallWaiterEnable, 
      this.isRoomDeliveryEnable, 
      this.isRoomDeliveryDobEnable, 
      this.canSearch,});

  User.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    storeName = json['store_name'];
    logoUrl = json['logo_url'];
    address = json['address'];
    description = json['description'];
    phone = json['phone'];
    themeId = json['theme_id'];
    subscriptionEndDate = json['subscription_end_date'];
    isVisible = json['is_visible'];
    addBy = json['add_by'];
    viewId = json['view_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isAcceptOrder = json['is_accept_order'];
    currencySymbol = json['currency_symbol'];
    serviceCharge = json['service_charge'];
    tax = json['tax'];
    tableEnable = json['table_enable'];
    searchEnable = json['search_enable'];
    languageEnable = json['language_enable'];
    whatsappbuttonEnable = json['whatsappbutton_enable'];
    diningEnable = json['dining_enable'];
    deliveryEnable = json['delivery_enable'];
    takeawayEnable = json['takeaway_enable'];
    fssaiNo = json['fssai_no'];
    kycVerified = json['kyc_verified'];
    isCallWaiterEnable = json['is_call_waiter_enable'];
    isRoomDeliveryEnable = json['is_room_delivery_enable'];
    isRoomDeliveryDobEnable = json['is_room_delivery_dob_enable'];
    canSearch = json['canSearch'];
  }
  int? id;
  String? email;
  String? storeName;
  String? logoUrl;
  String? address;
  String? description;
  String? phone;
  int? themeId;
  String? subscriptionEndDate;
  int? isVisible;
  dynamic addBy;
  String? viewId;
  String? createdAt;
  String? updatedAt;
  int? isAcceptOrder;
  String? currencySymbol;
  int? serviceCharge;
  int? tax;
  int? tableEnable;
  int? searchEnable;
  int? languageEnable;
  int? whatsappbuttonEnable;
  int? diningEnable;
  int? deliveryEnable;
  int? takeawayEnable;
  dynamic fssaiNo;
  int? kycVerified;
  int? isCallWaiterEnable;
  int? isRoomDeliveryEnable;
  int? isRoomDeliveryDobEnable;
  int? canSearch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['store_name'] = storeName;
    map['logo_url'] = logoUrl;
    map['address'] = address;
    map['description'] = description;
    map['phone'] = phone;
    map['theme_id'] = themeId;
    map['subscription_end_date'] = subscriptionEndDate;
    map['is_visible'] = isVisible;
    map['add_by'] = addBy;
    map['view_id'] = viewId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_accept_order'] = isAcceptOrder;
    map['currency_symbol'] = currencySymbol;
    map['service_charge'] = serviceCharge;
    map['tax'] = tax;
    map['table_enable'] = tableEnable;
    map['search_enable'] = searchEnable;
    map['language_enable'] = languageEnable;
    map['whatsappbutton_enable'] = whatsappbuttonEnable;
    map['dining_enable'] = diningEnable;
    map['delivery_enable'] = deliveryEnable;
    map['takeaway_enable'] = takeawayEnable;
    map['fssai_no'] = fssaiNo;
    map['kyc_verified'] = kycVerified;
    map['is_call_waiter_enable'] = isCallWaiterEnable;
    map['is_room_delivery_enable'] = isRoomDeliveryEnable;
    map['is_room_delivery_dob_enable'] = isRoomDeliveryDobEnable;
    map['canSearch'] = canSearch;
    return map;
  }

}