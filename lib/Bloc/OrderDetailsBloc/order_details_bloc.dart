
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/orderDetailsApi/orderDetailsApi.dart';
import '../../Repository/ModelClass/OrderDetailsModel.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  late OrderDetailsModel orderModel;
  OrderDetailsApi orderApi= OrderDetailsApi();
  OrderDetailsBloc() : super(OrderDetailsInitial()) {
    on<FetchOrdersDetails>((event, emit)async {
      emit(OrderDetailsBlocLoading());
      try{

        orderModel = await orderApi.getOrderDetails(order_id: event.orderId);
        emit(OrderDetailsBlocLoaded());
      } catch(e){
        print(e);
        emit(OrderDetailsBlocError());}
    });
  }
}