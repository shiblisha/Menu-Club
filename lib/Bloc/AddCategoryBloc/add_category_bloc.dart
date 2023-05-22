import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/AddCategoryApi/addCategoryApi.dart';
import '../../Repository/ModelClass/CategoryModel.dart';

part 'add_category_event.dart';

part 'add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  late CategoryModel AddCategoryModel;
  AddCategoryApi addCategoryApi = AddCategoryApi();

  AddCategoryBloc() : super(AddCategoryInitial()) {
    on<FetchAddCategory>((event, emit) async {
      emit(AddCategoryBlocLoading());
      try {
        AddCategoryModel = await addCategoryApi.getAddCategory(shopId:event.ShopId , name: event.name, image:event.image, image_extension:event.image_extension, is_active: event.is_active, CategoryId: event.CategoryId);
        emit(AddCategoryBlocLoaded());
      } catch (e) {
        print(e);
        emit(AddCategoryBlocError());
      }
    });
  }
}
