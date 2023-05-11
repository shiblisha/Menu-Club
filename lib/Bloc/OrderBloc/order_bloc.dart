import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/OrderApi/orderApi.dart';
import '../../Repository/ModelClass/OrderModel.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderModel orderModel;
  OrderApi orderApi= OrderApi();
  OrderBloc() : super(OrderInitial()) {
    on<FetchOrders>((event, emit) async{
      emit(OrderBlocLoading());
      try{

        orderModel = await orderApi.getOrder(shopId: event.ShopId);
        emit(OrderBlocLoaded());
      } catch(e){
        print(e);
        emit(OrderBlocError());}
    });
  }
}
