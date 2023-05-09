
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../Repository/Api/LoginApi/loginApi.dart';
import '../../Repository/ModelClass/LoginModel.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModel loginModel;
  LoginApi netflixApi=LoginApi();
  LoginBloc() : super(LoginInitial()) {
    on<FetchLogin>((event, emit)async{
      emit(LoginBlocLoading());
      try{

        loginModel = await netflixApi.getLoginInfo(email:event.email, password: event.password);
        emit(LoginBlocLoaded());
      } catch(e){
        print(e);
        emit(LoginBlocError());}
    });
  }
}
