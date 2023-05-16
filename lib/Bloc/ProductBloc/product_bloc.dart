
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/ProductApi/ProductApi.dart';
import '../../Repository/ModelClass/ProductModel.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
   late ProductModel productData;
  ProductApi productApi=ProductApi();
  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>((event, emit)async {
      emit(ProductblocLoading());
      try{

        productData = await productApi.getProduct(shopId: event.shopId);

        emit(ProductblocLoaded());
      } catch(e){
        print(e);
        emit(ProductblocError());}
      // TODO: implement event handler
    });
  }
}