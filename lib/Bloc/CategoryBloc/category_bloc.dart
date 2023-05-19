import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../Repository/Api/CategoryApi/categoryApi.dart';
import '../../Repository/ModelClass/CategoryModel.dart';
part 'category_event.dart';
part 'category_state.dart';



class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  late CategoryModel categoryData;
  CategoryApi categoryApi=CategoryApi();
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategory>((event, emit)async {
      emit(CategoryblocLoading());
      try{

        categoryData = await categoryApi.getCategory(shopId: event.shopId);
        print(categoryData.payload!.data);
        emit(CategoryblocLoaded());
      } catch(e){
        print(e);
        emit(CategoryblocError());}
      // TODO: implement event handler
    });
  }
}
