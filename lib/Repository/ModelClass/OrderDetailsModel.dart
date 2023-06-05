class OrderDetailsModel {
  OrderDetailsModel({
      this.success, 
      this.status, 
      this.payload,});

  OrderDetailsModel.fromJson(dynamic json) {
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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.orderUniqueId, 
      this.storeId, 
      this.tableNo, 
      this.customerName, 
      this.customerPhone, 
      this.subTotal, 
      this.discount, 
      this.tax, 
      this.storeCharge, 
      this.total, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.comments, 
      this.paymentStatus, 
      this.orderType, 
      this.address, 
      this.paymentType, 
      this.callWaiterEnabled, 
      this.couponName, 
      this.roomNumber, 
      this.dobCustomer, 
      this.orderDetails,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    orderUniqueId = json['order_unique_id'];
    storeId = json['store_id'];
    tableNo = json['table_no'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    subTotal = json['sub_total'];
    discount = json['discount'];
    tax = json['tax'];
    storeCharge = json['store_charge'];
    total = json['total'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    comments = json['comments'];
    paymentStatus = json['payment_status'];
    orderType = json['order_type'];
    address = json['address'];
    paymentType = json['payment_type'];
    callWaiterEnabled = json['call_waiter_enabled'];
    couponName = json['coupon_name'];
    roomNumber = json['room_number'];
    dobCustomer = json['dob_customer'];
    if (json['order_details'] != null) {
      orderDetails = [];
      json['order_details'].forEach((v) {
        orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }
  int? id;
  String? orderUniqueId;
  int? storeId;
  dynamic tableNo;
  String? customerName;
  String? customerPhone;
  String? subTotal;
  dynamic discount;
  String? tax;
  String? storeCharge;
  String? total;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic comments;
  int? paymentStatus;
  int? orderType;
  dynamic address;
  String? paymentType;
  int? callWaiterEnabled;
  dynamic couponName;
  dynamic roomNumber;
  dynamic dobCustomer;
  List<OrderDetails>? orderDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_unique_id'] = orderUniqueId;
    map['store_id'] = storeId;
    map['table_no'] = tableNo;
    map['customer_name'] = customerName;
    map['customer_phone'] = customerPhone;
    map['sub_total'] = subTotal;
    map['discount'] = discount;
    map['tax'] = tax;
    map['store_charge'] = storeCharge;
    map['total'] = total;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['comments'] = comments;
    map['payment_status'] = paymentStatus;
    map['order_type'] = orderType;
    map['address'] = address;
    map['payment_type'] = paymentType;
    map['call_waiter_enabled'] = callWaiterEnabled;
    map['coupon_name'] = couponName;
    map['room_number'] = roomNumber;
    map['dob_customer'] = dobCustomer;
    if (orderDetails != null) {
      map['order_details'] = orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderDetails {
  OrderDetails({
      this.id, 
      this.orderId, 
      this.name, 
      this.price, 
      this.quantity, 
      this.createdAt, 
      this.updatedAt, 
      this.orderDetailsExtraAddon,});

  OrderDetails.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['order_id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_details_extra_addon'] != null) {
      orderDetailsExtraAddon = [];
      json['order_details_extra_addon'].forEach((v) {
        orderDetailsExtraAddon?.add(json.fromJson(v));
      });
    }
  }
  int? id;
  int? orderId;
  String? name;
  String? price;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? orderDetailsExtraAddon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_id'] = orderId;
    map['name'] = name;
    map['price'] = price;
    map['quantity'] = quantity;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (orderDetailsExtraAddon != null) {
      map['order_details_extra_addon'] = orderDetailsExtraAddon?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}