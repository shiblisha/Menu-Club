class OrderModel {
  OrderModel({
      this.success, 
      this.status, 
      this.payload,});

  OrderModel.fromJson(dynamic json) {
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
      this.dobCustomer,});

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
  }
  dynamic id;
  dynamic orderUniqueId;
  dynamic storeId;
  dynamic tableNo;
  dynamic customerName;
  dynamic customerPhone;
  dynamic subTotal;
  dynamic discount;
  dynamic tax;
  dynamic storeCharge;
  dynamic total;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic comments;
  dynamic paymentStatus;
  dynamic orderType;
  dynamic address;
  dynamic paymentType;
  dynamic callWaiterEnabled;
  dynamic couponName;
  dynamic roomNumber;
  dynamic dobCustomer;

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
    return map;
  }

}